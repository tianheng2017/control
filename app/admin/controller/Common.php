<?php

namespace app\admin\controller;

use app\admin\logic\CommonLogic;
use app\common\controller\AdminController;
use think\facade\Db;

class Common extends AdminController
{
    /**
     * @NodeAnotation(title="增量导入")
     */
    public function import()
    {
        if ($this->request->isAjax()) {
            try {
                $file = $this->request->file('file');
                $data = (new CommonLogic())->getImportData($file);

                $arr = [];
                foreach ($data as $v) {
                    $arr[] = [
                        'name'      =>  $v[0],
                        'idcard'    =>  $v[1],
                        'sex'       =>  $v[2],
                        'age'       =>  $v[3],
                        'province'  =>  $v[4],
                        'city'      =>  $v[5],
                        'area'      =>  $v[6],
                        'address'   =>  $v[7],
                        'phone'     =>  $v[8],
                        'source'    =>  $v[9],
                        'md5'       =>  md5($v[0].$v[1].$v[2].$v[3].$v[4].$v[5].$v[6].$v[7].$v[8].$v[9])
                    ];
                }

                //md5字段为unique索引，忽略报错插入进行去重
//                Db::name('data')->extra('ignore')->insertAll($arr);
            } catch (\Exception $e) {
                $this->error($e->getMessage());
            }
            $this->success('导入成功');
        }
        return $this->fetch();
    }
}