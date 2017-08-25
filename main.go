package main

import (
	_"work/init"
	_"work/routers"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
)

func main() {
	//开启 ORM 调试模式
	orm.Debug = true

	//设置静态文件处理目录
	beego.SetStaticPath("/static", "static")

	beego.Run()
}