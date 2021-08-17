<?php

namespace app\api\controller;

use app\ApiBaseController;
use think\Exception;

class Index extends ApiBaseController
{
    public function index()
    {
        return result(1,'疫情防控系统API');
    }
}