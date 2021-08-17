<?php

namespace app\admin\controller;

use app\common\controller\AdminController;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use think\App;

/**
 * @ControllerAnnotation(title="社区管理")
 */
class Community extends AdminController
{

    use \app\admin\traits\Curd;

    public function __construct(App $app)
    {
        parent::__construct($app);

        $this->model = new \app\admin\model\Community();
        
    }

    /**
     * @NodeAnotation(title="删除")
     */
    public function delete()
    {
        $ids = $this->request->param('id');
        $row = $this->model->whereIn('id', $ids)->select();
        $row->isEmpty() && $this->error('数据不存在');

        //判断社区有无被引用
        $count = \app\admin\model\Form1::whereIn('community', $ids)->count();
        if ($count) {
            $this->error('该社区已被他处引用，请解除后再删');
        }

        try {
            $save = $row->delete();
        } catch (\Exception $e) {
            $this->error('删除失败');
        }
        $save ? $this->success('删除成功') : $this->error('删除失败');
    }

    
}