<?php
// +----------------------------------------------------------------------
// | 路由设置
// +----------------------------------------------------------------------

return [
    // 默认控制器名
    'default_controller'    => 'Index',
    // 默认操作名
    'default_action'        => 'index',
    // 路由中间件
    'middleware' => [
        // 跨域支持
        \think\middleware\AllowCrossDomain::class,
    ],
];
