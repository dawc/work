package models

import (
	"github.com/astaxie/beego/orm"
)

type Article struct {
	Id     int64  `form:"-"`
	Name   string `form:"name" valid:"MinSize(5);MaxSize(20)"`
	Client string `form:"client"`
	Url    string `form:"url"`
	Notes  string `form:"notes"`
}

func init() {
	// 需要在init中注册定义的model
	orm.RegisterModel(new(Article))
}

//get article list
func GetArticleList(page int64, page_size int64, sort string) (articles []orm.Params, count int64) {
	o := orm.NewOrm()
	article := new(Article)
	qs := o.QueryTable(article)
	var offset int64
	if page <= 1 {
		offset = 0
	} else {
		offset = (page - 1) * page_size
	}
	qs.Limit(page_size, offset).OrderBy(sort).Values(&articles)
	count, _ = qs.Count()
	return articles, count

}

//添加
func Add(a *Article) (int64, error) {
	o := orm.NewOrm()
	article := new(Article)

	article.Name = a.Name
	article.Client = a.Client
	article.Url = a.Url
	article.Notes = a.Notes

	id, err := o.Insert(article)
	return id, err
}

//修改
func Update(a *Article) (int64, error) {
	o := orm.NewOrm()
	article := make(orm.Params)

	article["Name"] = a.Name
	article["Client"] = a.Client
	article["Url"] = a.Url
	article["Notes"] = a.Notes

	var table Article
	num, err := o.QueryTable(table).Filter("Id", a.Id).Update(article)
	return num, err
}

//删除一条数据
func DelArticleById(id int64) (int64, error) {
	o := orm.NewOrm()
	status, err := o.Delete(&Article{Id: id})
	return status, err
}

//获取一条数据
func GetArticleById(id int64) (article Article) {
	article = Article{Id: id}
	o := orm.NewOrm()
	o.Read(&article, "Id")
	return article
}
