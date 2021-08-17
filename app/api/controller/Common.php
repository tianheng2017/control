<?php

namespace app\api\controller;

use app\ApiBaseController;
use EasyAdmin\upload\Uploadfile;
use think\Exception;

class Common extends ApiBaseController
{
    public function upload()
    {
        $data = [
            'upload_type' => $this->request->post('upload_type'),
            'file'        => $this->request->file('file'),
        ];
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
        } catch (\Exception $e) {
            return result(0, $e->getMessage());
        }
        return result(1, $upload['msg'], ['id' => $upload['id'], 'url' => $upload['url']]);
    }
}