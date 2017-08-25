package uitls

import (
	"encoding/json"
	"fmt"
)

//返回消息机构体
type Message struct {
	Code int      `json:"code"`
	Msg  string   `json:"msg"`
	Data map[string]interface{} `json:"data"`
}

//返回消息函数
func MsgCode(code int, msg string, data map[string]interface{})([]byte, error){

	if data == nil {
		data = make(map[string]interface{})
	}

	m := Message{
		Code: code,
		Msg: msg,
		Data: data,
	}

	result, err := json.Marshal(m)
	if err != nil {
		fmt.Println("error:", err)
	}

	return result, err
}