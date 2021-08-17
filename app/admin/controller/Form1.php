<?php

namespace app\admin\controller;

use app\common\controller\AdminController;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use EasyAdmin\tool\CommonTool;
use jianyan\excel\Excel;
use think\App;
use think\facade\Db;

/**
 * @ControllerAnnotation(title="返沙人员管理")
 */
class Form1 extends AdminController
{
    public function __construct(App $app)
    {
        parent::__construct($app);

        $this->model = new \app\admin\model\Form1();
        
        $this->assign('getSexList', $this->model->getSexList());

        $this->assign('getCheckResultList', $this->model->getCheckResultList());

        $this->assign('getCommunityList', $this->model->getCommunityList());
    }

    /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            if (input('selectFields')) {
                return $this->selectList();
            }
            list($page, $limit, $where) = $this->buildTableParames();
            $count = $this->model
                ->where($where)
                ->count();
            $list = $this->model
                ->where($where)
                ->page($page, $limit)
                ->order($this->sort)
                ->select();
            $data = [
                'code'  => 0,
                'msg'   => '',
                'count' => $count,
                'data'  => $list,
            ];
            return json($data);
        }
        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="添加")
     */
    public function add()
    {
        if ($this->request->isAjax()) {
            $post = $this->request->post();
            $rule = [
                'name|姓名'                          =>  'require|chs',
                'sex|性别'                           =>  'require',
                'id_card|身份证号'                   =>  'require|idCard',
                'arrival_time|到沙时间'              =>  'require|date',
                'check_time|最近一次核酸检测时间'    =>  'require|date',
                'check_result|核酸检测结果'          =>  'require',
                'community|居住地所属社区'           =>  'require',
                'mobile|手机号'                      =>  'require|mobile',
                'image1|健康码'                      =>  'require',
                'image2|行程码'                      =>  'require',
            ];
            $this->validate($post, $rule);
            try {
                $save = $this->model->save($post);
            } catch (\Exception $e) {
                $this->error('保存失败:'.$e->getMessage());
            }
            $save ? $this->success('保存成功') : $this->error('保存失败');
        }
        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="编辑")
     */
    public function edit()
    {
        $row = $this->model->find($this->request->param($this->model->getPk()));
        empty($row) && $this->error('数据不存在');
        if ($this->request->isAjax()) {
            $post = $this->request->post();
            $rule = [
                'name|姓名'                          =>  'require|chs',
                'sex|性别'                           =>  'require',
                'id_card|身份证号'                   =>  'require|idCard',
                'arrival_time|到沙时间'              =>  'require|date',
                'check_time|最近一次核酸检测时间'    =>  'require|date',
                'check_result|核酸检测结果'          =>  'require',
                'community|居住地所属社区'           =>  'require',
                'mobile|手机号'                      =>  'require|mobile',
                'image1|健康码'                      =>  'require',
                'image2|行程码'                      =>  'require',
            ];
            $this->validate($post, $rule);
            try {
                $save = $row->save($post);
            } catch (\Exception $e) {
                $this->error('保存失败');
            }
            $save ? $this->success('保存成功') : $this->error('保存失败');
        }
        $this->assign('row', $row);
        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="删除")
     */
    public function delete()
    {
        $row = $this->model->whereIn($this->model->getPk(), $this->request->param($this->model->getPk()))->select();
        $row->isEmpty() && $this->error('数据不存在');
        try {
            $save = $row->delete();
        } catch (\Exception $e) {
            $this->error('删除失败');
        }
        $save ? $this->success('删除成功') : $this->error('删除失败');
    }

    /**
     * @NodeAnotation(title="导出")
     */
    public function export()
    {
        list($page, $limit, $where) = $this->buildTableParames();
        $tableName = $this->model->getName();
        $tableName = CommonTool::humpToLine(lcfirst($tableName));
        $prefix = config('database.connections.mysql.prefix');
        $dbList = Db::query("show full columns from {$prefix}{$tableName}");
        $header = [];
        foreach ($dbList as $vo) {
            $comment = !empty($vo['Comment']) ? $vo['Comment'] : $vo['Field'];
            if (!in_array($vo['Field'], $this->noExportFields)) {
                $header[] = [$comment, $vo['Field']];
            }
        }
        $list = $this->model
            ->where($where)
            ->limit(100000)
            ->order($this->sort)
            ->select()
            ->toArray();
        $fileName = time();
        return Excel::exportData($list, $header, $fileName, 'xlsx');
    }

    
}