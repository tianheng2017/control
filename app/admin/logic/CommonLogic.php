<?php

namespace app\admin\logic;

use app\admin\controller\system\Uploadfile;
use app\common\controller\AdminController;
use jianyan\excel\Excel;
use think\App;
use think\Exception;

class CommonLogic extends AdminController
{
    public function __construct(App $app)
    {
        parent::__construct($app);
    }
    
    // 解析xlsx文件数据
    public function getImportData($file)
    {
        $data = ['file' => $file];

        $uploadConfig = sysconfig('upload');
        empty($data['upload_type']) && $data['upload_type'] = $uploadConfig['upload_type'];

        $rule = [
            'upload_type|指定上传类型有误' => "in:{$uploadConfig['upload_allow_type']}",
            'file|文件'              => "require|file|fileExt:{$uploadConfig['upload_allow_ext']}|fileSize:{$uploadConfig['upload_allow_size']}",
        ];
        $this->validate($data, $rule);

        try {
            $upload = Uploadfile::instance()
                ->setUploadType($data['upload_type'])
                ->setUploadConfig($uploadConfig)
                ->setFile($data['file'])
                ->save();
            if ($upload['save'] <> true) throw new Exception($upload['msg']);

            $url_arr = parse_url($upload['url']);
            $path = root_path() . '/public/' . trim($url_arr['path'],'/');
            $data = Excel::import($path, 2);
            if (empty($data)) throw new Exception('导入文件的数据行不能为空');

            return $data;
        } catch (\Exception $e) {
            self::$error = $e->getMessage();
            return false;
        }
    }
    
}