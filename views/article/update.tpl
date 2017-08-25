<!DOCTYPE html>
<html>
    <head>
        <title>Beego user</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    </head>
    <body>
        <div>
            <div style="border:1px solid gray;">
                <div>beego输出：</div>
                <form id="user" method="post" action="/article/updatepost">
                    <div>序号：{{.list.Id}}</div>
                    <div>标题：<input name="name" type="text" value="{{.list.Name}}" /></div>
                    <div>客户端：<input name="client" type="text" value="{{.list.Client}}" /></div>
                    <div>地址：<input name="url" type="text" value="{{.list.Url}}" /></div>
                    <div>说明：<input name="notes" type="text" value="{{.list.Notes}}" /></div>
                    <input name="id" type="hidden" value="{{.list.Id}}" />
                    <input type="submit" value="提交" />
                </form>
            </div>
        </div>
    </body>
</html>