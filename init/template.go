package init

import (
	"github.com/astaxie/beego"
	."work/app/admin/lib"
)

func TplFunc() {
	//自定义模板函数
	beego.AddFuncMap("stringsToJson", StringsToJson)
}
