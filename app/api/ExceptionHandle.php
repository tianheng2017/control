<?php
namespace app\api;

use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\exception\ErrorException;
use think\exception\Handle;
use think\exception\HttpException;
use think\exception\HttpResponseException;
use think\exception\ValidateException;
use think\Response;
use Throwable;

/**
 * 应用异常处理类
 */
class ExceptionHandle extends Handle
{
    /**
     * 不需要记录信息（日志）的异常类列表
     * @var array
     */
    protected $ignoreReport = [
        HttpException::class,
        HttpResponseException::class,
        ModelNotFoundException::class,
        DataNotFoundException::class,
        ValidateException::class,
    ];

    /**
     * 记录异常信息（包括日志或者其它方式记录）
     *
     * @access public
     * @param  Throwable $exception
     * @return void
     */
    public function report(Throwable $exception): void
    {
        // 使用内置的方式记录异常日志
        parent::report($exception);
    }

    /**
     * Render an exception into an HTTP response.
     *
     * @access public
     * @param \think\Request   $request
     * @param Throwable $e
     * @return Response
     */
    public function render($request, Throwable $e): Response
    {
        if ($e instanceof HttpException || $e instanceof ValidateException || $e instanceof ErrorException) {
            return json([
                'code'  =>  $e instanceof ValidateException ? 1 : 3,
                'msg'   =>  $e->getMessage(),
                'data'  =>  null,
            ], 200, $header = [
                'Access-Control-Allow-Headers'     => '*',
                'Access-Control-Allow-Origin'      => '*',
                'Access-Control-Allow-Credentials' => 'true',
                'Access-Control-Allow-Methods'     => 'GET, POST, PATCH, PUT, DELETE, OPTIONS',
            ]);
        }
        // 其他错误交给系统处理
        return parent::render($request, $e);
    }
}
