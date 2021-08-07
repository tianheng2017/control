<?php

/**
 *  Token验证中间件
 */

namespace app\api\middleware;

class CheckToken
{
    /**
     * @param $request
     * @param \Closure $next
     */
    public function handle($request, \Closure $next)
    {
        $token = $request->header('token');
        $controller = $request->controller();
        $no_login = ['Login','Error'];
        if (in_array($controller, $no_login)){
            return $next($request);
        }
        if ($token){
            $res = checkToken($token);
            if ($res['code'] == 0 && isset($res['data']['id']) && isset($res['data']['hash'])){
                $request->id = $res['data']['id'];
                $request->hash = $res['data']['hash'];
                return $next($request);
            }
        }
        return result(2, '鉴权失败');
    }
}