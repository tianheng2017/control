define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'community/index',
        add_url: 'community/add',
        edit_url: 'community/edit',
        delete_url: 'community/delete',
        export_url: 'community/export',
        modify_url: 'community/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},
                    {field: 'id', title: 'ID', width: 100},
                    {field: 'name', title: '社区名称'},
                    {field: 'mobile', title: '社区电话'},
                    {field: 'address', title: '居委会地址'},
                    {field: 'create_time', title: '创建时间'},
                    {width: 250, title: '操作', templet: ea.table.tool},

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