<?php
// +----------------------------------------------------------------------
// | 路由设置
// +----------------------------------------------------------------------

return [
    // 默认控制器名
    'default_controller'    => 'Error',
    // 默认操作名
    'default_action'        => '',
    // 路由中间件
    'middleware' => [
        // 检测Token
        \app\api\middleware\CheckToken::class,
        // 跨域支持
        \think\middleware\AllowCrossDomain::class,
    ],
];
