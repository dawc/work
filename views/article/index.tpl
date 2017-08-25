<!DOCTYPE html>
<html>
    <head>
        <title>文章</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <script type="text/javascript" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
        <script type="text/javascript" src='/static/js/layer/layer.js'></script>
    </head>
    <body>
        <div style="border:1px solid gray;">
            <div style="margin:10px 0 10px">测试数据-文章列表</div>
            <div><a href="/article/add/">添加</a></div>
            <table border="1" width="80%">
                <tr>
                    <th>序号</th>
                    <th>标题</th>
                    <th>客户端</th>
                    <th>地址</th>
                    <th>说明</th>
                    <th>编辑</th>
                </tr>
                {{range $k,$v := .list.rows}}
                <tr>
                    <td>{{$v.Id}}</td>
                    <td>{{$v.Name}}</td>
                    <td>{{$v.Client}}</td>
                    <td>{{$v.Url}}</td>
                    <td>{{$v.Notes}}</td>
                    <td>
                        <a href="/article/update/{{$v.Id}}">修改</a> |
                        <a class="layui-btn" href="javascript:del({{$v.Id}});">删除</a>
                    </td>
                </tr>
                {{end}}
            </table>
        </div>
        <script type="text/javascript">
            function del(id){
                layer.confirm('<div align="center"><span>您确定要删除吗？</span></div>', {
                    btn: ['确定','取消']
                }, function(){
                    $.ajax({
                        type:"POST",
                        url:"/article/delete",
                        data:{id:id},
                        dataType: "json",
                        success:function(result){
                            if(result.code == 10000){
                                layer.msg('删除成功', {icon: 1});
                                window.location.reload()
                            }else{
                                layer.msg('删除失败', {icon: 2});
                            }
                        }
                    });
                });
            }
        </script>
    </body>
</html>