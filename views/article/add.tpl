<!DOCTYPE html>
<html>
    <head>
        <title>添加</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    </head>
    <body>
        <div>
            <div style="border:1px solid gray;">
                <div>添加</div>
                <form id="user" method="post" action="/article/add">
                    <div>标题：<input name="name" type="text" value="" /></div>
                    <div>客户端：<input name="client" type="text" value="" /></div>
                    <div>地址：<input name="url" type="text" value="" /></div>
                    <div>说明：<input name="notes" type="text" value="" /></div>
                    <input type="submit" value="提交" />
                </form>
            </div>
        </div>
    </body>
</html>