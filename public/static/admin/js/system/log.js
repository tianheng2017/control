define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'system.log/index',
        export_url: 'system.log/export',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                toolbar:['refresh','export'],
                cols: [[
                    {type: 'checkbox'},
                    {field: 'id', title: 'ID', width: 100},
                    {field: 'systemAdmin.username', title: '管理员账号', width: 100},
                    {field: 'url', title: '操作页面'},
                    {field: 'method', title: '请求方法'},
                    {field: 'ip', title: 'IP'},
                    {field: 'useragent', title: 'User-Agent'},
                    {field: 'create_time', title: '操作时间'},
                ]],
            });

            ea.listen();
        },
    };
    return Controller;
});