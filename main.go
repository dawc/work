package main

import (
	_"work/init"
	_"work/routers"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	"net/http"
	"text/template"
)

func page_not_found(rw http.ResponseWriter, r *http.Request){
	t,_:= template.New("404.tpl").ParseFiles(beego.BConfig.WebConfig.ViewsPath+"/404.tpl")
	data :=make(map[string]interface{})
	data["content"] = "page not found"
	t.Execute(rw, data)
}

func main() {
	//开启 ORM 调试模式
	orm.Debug = true

	//404页面
	beego.ErrorHandler("404",page_not_found)
	//设置静态文件处理目录
	beego.SetStaticPath("/static", "static")

	beego.Run()
}