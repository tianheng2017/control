<?php

namespace app\api\controller;

use app\admin\model\Community as CommunityModel;
use app\ApiBaseController;
use think\Exception;

class Community extends ApiBaseController
{
    public function getCommunityList()
    {
        $list = CommunityModel::field('name as label,id as value')->select();
        foreach ($list as $k => &$v) {
            $v['extra'] = $k;
        }
        return result(1,'',$list);
    }
}