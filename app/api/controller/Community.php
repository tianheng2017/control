<?php

namespace app\api\controller;

use app\admin\model\Community as CommunityModel;
use app\ApiBaseController;
use think\Exception;

class Community extends ApiBaseController
{
    public function getCommunityList()
    {
        $list = CommunityModel::column('name','id');
        return result(1,'',$list);
    }
}