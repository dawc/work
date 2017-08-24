package controllers

import (
	"github.com/astaxie/beego"
	_"reflect"
	m"work/app/home/models"
	"encoding/json"
	"work/uitls"
	"strconv"
	"fmt"
)

type ArticleController struct {
	beego.Controller
}

func (this *ArticleController) Get() {
	page, _ := this.GetInt64("page")
	page_size, _ := this.GetInt64("rows")
	sort := this.GetString("sort")
	order := this.GetString("order")
	if len(order) > 0 {
		if order == "desc" {
			sort = "-" + sort
		}
	} else {
		sort = "Id"
	}
	data, count := m.GetArticleList(page, page_size, sort)
	this.Data["list"] = &map[string]interface{}{"total": count, "rows": &data}
	this.TplName = "article/index.tpl"
}


func (this *ArticleController) Add() {

	if this.Ctx.Request.Method == "POST" {
		a := m.Article{}
		var result []byte
		if err := this.ParseForm(&a); err != nil {
			result, _ := uitls.MsgCode(10001, "添加失败", nil)
			result = result
		}
		id, err := m.Add(&a)
		if err == nil && id > 0 {
			this.Redirect("/article/index/", 302)
		} else {
			result, _ := uitls.MsgCode(10001, "添加失败", nil)
			result = result
		}
		var data map[string]interface{}
		if err := json.Unmarshal([]byte(result), &data); err == nil {
			//fmt.Println("==============json str 转map=======================")
			///fmt.Println(data)
		}
		this.Data["list"] = data
		this.ServeJSON()
	}

	this.TplName = "article/add.tpl"
}

func (this *ArticleController) Update() {

	id := this.Ctx.Input.Param(":id")
	intid, _ := strconv.Atoi(id)
	data := m.GetArticleById(int64(intid))

	this.Data["list"] = data
	this.TplName = "article/update.tpl"
}

func (this *ArticleController) UpdatePost() {

	if this.Ctx.Request.Method == "POST" {
		id := this.Input().Get("id")
		intid, _ := strconv.Atoi(id)
		a := m.Article{Id: int64(intid)}

		if err := this.ParseForm(&a); err != nil {
			this.Redirect("/article/update/"+id , 302)
		}
		if _, err := m.Update(&a); err == nil {
			this.Redirect("/article/index/", 302)
		} else {
			this.Redirect("/article/update/"+id , 302)
		}
	}

	this.TplName = "article/index.tpl"
}

func (this *ArticleController) Delete() {

	if this.Ctx.Request.Method == "POST" {

		id := this.Input().Get("id")
		intid, _ := strconv.Atoi(id)

		var msgcode []byte
		if _, err := m.DelArticleById(int64(intid)); err == nil {
			result, _ := uitls.MsgCode(10000, "删除成功", nil)
			msgcode = result
		} else {
			result, _ := uitls.MsgCode(10001, "删除失败", nil)
			msgcode = result
		}

		var data map[string]interface{}
		if err := json.Unmarshal([]byte(msgcode), &data); err == nil {
			//fmt.Println("==============json str 转map=======================")
			//fmt.Println(data)
		}

		this.Data["json"] = data
		this.ServeJSON()
	}

	this.TplName = "article/index.tpl"
}