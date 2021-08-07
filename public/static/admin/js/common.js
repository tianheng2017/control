define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        import_url: 'common/import',
    };

    var upload = layui.upload;

    var Controller = {

        import: function () {
            let msg;
            upload.render({
                elem: '.upload'
                ,url: ea.url(init.import_url)
                ,accept: 'file'
                ,exts: 'xlsx'
                ,before: function(obj){
                    index = layer.msg('上传中...', {
                        icon: 16
                        ,shade: 0.01
                        ,time: 200000
                    });
                }
                ,done: function(res){
                    layer.close(msg);
                    if (res.code) {
                        layer.msg(res.msg, {icon: 1, time: 1500}, function () {
                            let index = parent.layer.getFrameIndex(window.name);
                            parent.$('[data-table-refresh]').trigger("click");
                            parent.layer.close(index);
                        });
                        return true;
                    }
                    layer.msg(res.msg, {icon: 2, time:1500});
                }
                ,progress: function(n){
                    $('.layui-layer-padding').html('<i class="layui-layer-ico layui-layer-ico16"></i>'+  '上传中...' + n + '%');
                }
            });
            ea.listen();
        },
    };
    return Controller;
});