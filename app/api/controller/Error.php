<?php

namespace app\api\controller;

use think\exception\HttpResponseException;

class Error
{
    public function __call($name, $arguments)
    {
       throw new HttpResponseException([
           'code'   =>  3,
           'msg'    =>  '异常请求',
           'data'   =>  null
       ], 200, $header = [
           'Access-Control-Allow-Headers'     => '*',
           'Access-Control-Allow-Origin'      => '*',
           'Access-Control-Allow-Credentials' => 'true',
           'Access-Control-Allow-Methods'     => 'GET, POST, PATCH, PUT, DELETE, OPTIONS',
       ]);
    }
}