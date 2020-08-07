<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class SystemLog extends TimeModel
{

    protected $name = "system_log_202008";

    protected $deleteTime = false;

    public function systemAdmin()
    {
        return $this->belongsTo('\app\admin\model\SystemAdmin', 'admin_id', 'id');
    }

}