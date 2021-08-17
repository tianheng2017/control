define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'form1/index',
        add_url: 'form1/add',
        edit_url: 'form1/edit',
        delete_url: 'form1/delete',
        export_url: 'form1/export',
        modify_url: 'form1/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},
                    {field: 'id', hide: true},
                    {field: 'name', title: '姓名'},
                    {field: 'sex', search: 'select', selectList: ["男","女"], title: '性别'},
                    {field: 'id_card', title: '身份证'},
                    {field: 'arrival_time', title: '到沙时间'},
                    {field: 'departure', title: '出发地'},
                    {field: 'check_time', title: '最近核酸检测时间'},
                    {field: 'check_result', search: 'select', selectList: ["阴性","阳性"], title: '检测结果'},
                    {field: 'community', title: '所属社区', selectList: getCommunityList},
                    {field: 'mobile', title: '手机号'},
                    {field: 'create_time', title: '创建时间'},
                    {
                        width: 120,
                        title: '操作',
                        templet: ea.table.tool,
                        operat: [
                            [{
                                text: '编辑',
                                url: init.edit_url,
                                method: 'open',
                                auth: 'edit',
                                class: 'layui-btn layui-btn-xs layui-btn-success',
                                extend: 'data-full="true"'
                            }, {
                                text: '删除',
                                title: '确定删除？',
                                url: init.delete_url,
                                method: 'request',
                                auth: 'delete',
                                class: 'layui-btn layui-btn-xs layui-btn-danger',
                            }]
                        ]
                    }
                ]],
            });

            ea.listen();
        },
        add: function () {
            ea.listen();
        },
        edit: function () {
            ea.listen();
        },
    };
    return Controller;
});