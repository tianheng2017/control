<?php
declare (strict_types = 1);

namespace app;

use app\admin\model\User;
use think\App;
use think\exception\ValidateException;
use think\Validate;

/**
 * 控制器基础类
 */
abstract class ApiBaseController
{
    /**
     * 用户UID
     */
    protected $id;

    /**
     * 用户
     */
    protected $user;

    /**
     * Request实例
     * @var \think\Request
     */
    protected $request;

    /**
     * 应用实例
     * @var \think\App
     */
    protected $app;

    /**
     * 是否批量验证
     * @var bool
     */
    protected $batchValidate = false;

    /**
     * 控制器中间件
     * @var array
     */
    protected $middleware = [];
    
    /**
     * 错误信息
     * @var string
     */
    protected static $error;

    /**
     * 构造方法
     * @access public
     * @param  App  $app  应用对象
     */
    public function __construct(App $app)
    {
        $this->app     = $app;
        $this->request = $this->app->request;

        // 控制器初始化
        $this->initialize();
    }

    // 初始化
    protected function initialize()
    {
        $no_login = ['Login','Error'];

        $controller = $this->request->controller();
        if (!in_array($controller, $no_login)){
            $user = User::find($this->request->id);

            if (empty($user)){
                return result(2,'用户不存在');
            }

            $hash = md5($user->id.$user->password);
            if ($this->request->hash <> $hash){
                return result(2,'token失效');
            }

            $this->id = $user->id;
            $this->user = $user->hidden(['password']);
        }
    }
    
    /**
     * 返回错误信息
     * @access public
     * @return string|array
     */
    public static function getError()
    {
        return self::$error;
    }

    /**
     * 验证数据
     * @access protected
     * @param  array        $data     数据
     * @param  string|array $validate 验证器名或者验证规则数组
     * @param  array        $message  提示信息
     * @param  bool         $batch    是否批量验证
     * @return array|string|true
     * @throws ValidateException
     */
    protected function validate(array $data, $validate, array $message = [], bool $batch = false)
    {
        if (is_array($validate)) {
            $v = new Validate();
            $v->rule($validate);
        } else {
            if (strpos($validate, '.')) {
                // 支持场景
                list($validate, $scene) = explode('.', $validate);
            }
            $class = false !== strpos($validate, '\\') ? $validate : $this->app->parseClass('validate', $validate);
            $v     = new $class();
            if (!empty($scene)) {
                $v->scene($scene);
            }
        }
        $v->message($message);
        if ($batch || $this->batchValidate) {
            $v->batch(true);
        }
        return $v->failException(true)->check($data);
    }

    // api专用验证器
    public function apiValidate(array $data, $validate, array $message = [], bool $batch = false)
    {
        try {
            $this->validate($data, $validate, $message, $batch);
        } catch (\Exception $e) {
            return result(0, $e->getMessage());
        }
        return true;
    }

}
