<?php

namespace app\api\controller;

use app\admin\model\Form1;
use app\BaseController;
use think\Exception;
use think\facade\Db;

class Index extends BaseController
{
    public function index()
    {
        return result(1,'疫情防控系统API');
    }

    public function form1()
    {
        try {
            $post = $this->request->post();
            $rule = [
                'name|姓名'                          =>  'require|chs',
                'sex|性别'                           =>  'require',
                'id_card|身份证号'                   =>  'require|idCard',
                'arrival_time|到沙时间'              =>  'require|date',
                'check_time|最近一次核酸检测时间'     =>  'require|date',
                'check_result|核酸检测结果'           =>  'require',
                'community|居住地所属社区'            =>  'require',
                'mobile|手机号'                      =>   'require|mobile',
                'image|健康码、行程码'                =>  'require',
            ];
            $this->validate($post, $rule);

            //验证码校验

            //最近一次核酸检测阳性报警
            //...

            Form1::create($post);
        } catch (\Exception $e) {
            return result(0, $e->getMessage());
        }
        return result(1,'提交成功');
    }
}