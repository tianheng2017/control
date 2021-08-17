<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class Form1 extends TimeModel
{

    protected $name = "form1";

    protected $deleteTime = false;

    
    
    public function getSexList()
    {
        return ['0'=>'男','1'=>'女',];
    }

    public function getCheckResultList()
    {
        return ['0'=>'阴性','1'=>'阳性',];
    }

    public function getCommunityList()
    {
        $arr = [0 => '无'];
        $list = Community::column('name','id');
        $new = array_merge($arr, $list);
        return $new;
    }


}