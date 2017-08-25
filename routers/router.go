package routers

import (
	"github.com/astaxie/beego"
	"work/app/home/controllers"
	"work/app/admin/controllers"
)

func init() {

	beego.Router("/", &controllers.MainController{})

	beego.Router("/article/index", &controllers.ArticleController{},"*:Get")
	beego.Router("/article/add", &controllers.ArticleController{},"*:Add")
	beego.Router("/article/update/:id([0-9]+)", &controllers.ArticleController{},"*:Update")
	beego.Router("/article/updatepost", &controllers.ArticleController{},"*:UpdatePost")
	beego.Router("/article/delete", &controllers.ArticleController{},"*:Delete")

	//admin
	ns := beego.NewNamespace("/manage",
		beego.NSNamespace("/admin",
			beego.NSRouter("/", &admin.MainController{}, "*:Index"),
			beego.NSRouter("/public/index", &admin.MainController{}, "*:Index"),
			beego.NSRouter("/public/login", &admin.MainController{}, "*:Login"),
			beego.NSRouter("/public/logout", &admin.MainController{}, "*:Logout"),
			beego.NSRouter("/public/changepwd", &admin.MainController{}, "*:Changepwd"),

			beego.NSRouter("/rbac/user/AddUser", &admin.UserController{}, "*:AddUser"),
			beego.NSRouter("/rbac/user/UpdateUser", &admin.UserController{}, "*:UpdateUser"),
			beego.NSRouter("/rbac/user/DelUser", &admin.UserController{}, "*:DelUser"),
			beego.NSRouter("/rbac/user/index", &admin.UserController{}, "*:Index"),

			beego.NSRouter("/rbac/node/AddAndEdit", &admin.NodeController{}, "*:AddAndEdit"),
			beego.NSRouter("/rbac/node/DelNode", &admin.NodeController{}, "*:DelNode"),
			beego.NSRouter("/rbac/node/index", &admin.NodeController{}, "*:Index"),

			beego.NSRouter("/rbac/group/AddGroup", &admin.GroupController{}, "*:AddGroup"),
			beego.NSRouter("/rbac/group/UpdateGroup", &admin.GroupController{}, "*:UpdateGroup"),
			beego.NSRouter("/rbac/group/DelGroup", &admin.GroupController{}, "*:DelGroup"),
			beego.NSRouter("/rbac/group/index", &admin.GroupController{}, "*:Index"),

			beego.NSRouter("/rbac/role/AddAndEdit", &admin.RoleController{}, "*:AddAndEdit"),
			beego.NSRouter("/rbac/role/DelRole", &admin.RoleController{}, "*:DelRole"),
			beego.NSRouter("/rbac/role/AccessToNode", &admin.RoleController{}, "*:AccessToNode"),
			beego.NSRouter("/rbac/role/AddAccess", &admin.RoleController{}, "*:AddAccess"),
			beego.NSRouter("/rbac/role/RoleToUserList", &admin.RoleController{}, "*:RoleToUserList"),
			beego.NSRouter("/rbac/role/AddRoleToUser", &admin.RoleController{}, "*:AddRoleToUser"),
			beego.NSRouter("/rbac/role/Getlist", &admin.RoleController{}, "*:Getlist"),
			beego.NSRouter("/rbac/role/index", &admin.RoleController{}, "*:Index"),
		),
	)

	beego.AddNamespace(ns)
}
