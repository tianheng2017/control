<?php


namespace app\admin\service;

use think\facade\Cache;

class ConfigService
{
    public static function getVersion()
    {
        return  Cache::tag('sysconfig')->remember('version', function(){
            $version = sysconfig('site', 'site_version');
            Cache::tag('sysconfig')->set('site_version', $version);
            return $version;
        }, 3600);
    }

}