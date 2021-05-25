package controller

import (
	"log"
	"net/http"
	"strconv"
	"swistory/api/model"
	"swistory/api/service"

	"github.com/gin-gonic/gin"
	"golang.org/x/crypto/bcrypt"
)

func UserAdd(c *gin.Context) {
	user := model.User{}
	err := c.Bind(&user)
	if err != nil {
		c.String(http.StatusBadRequest, "Bad request")
		return
	}
	userService := service.UserService{}
	err = userService.CreateUser(&user)
	if err != nil {
		c.String(http.StatusInternalServerError, "Server Error", err)
		return
	}
	c.JSON(http.StatusCreated, gin.H{
		"status": "ok",
	})
}

func UserLogin(c *gin.Context) {

	user := model.User{}
	err := c.Bind(&user)
	if err != nil {
		c.String(http.StatusBadRequest, "Bad request")
		return
	}
	userService := service.UserService{}
	dbPassword := userService.GetUser(c.PostForm("email")).Password
	// フォームから取得したユーザーパスワード
	formPassword := c.PostForm("password")

	// ユーザーパスワードの比較
	if err := bcrypt.CompareHashAndPassword([]byte(dbPassword), []byte(formPassword)); err != nil {
		log.Println("ログインできませんでした")
		c.String(http.StatusBadRequest, "Bad request")
	} else {
		c.JSON(http.StatusCreated, gin.H{
			"status": "ok",
		})
	}
}

func UserList(c *gin.Context) {
	userService := service.UserService{}
	UserLists := userService.GetUserList()
	c.JSONP(http.StatusOK, gin.H{
		"message": "ok",
		"data":    UserLists,
	})
}

func UserUpdate(c *gin.Context) {
	user := model.User{}
	err := c.Bind(&user)
	if err != nil {
		c.String(http.StatusBadRequest, "Bad request")
		return
	}
	userService := service.UserService{}
	err = userService.UpdateUser(&user)
	if err != nil {
		c.String(http.StatusInternalServerError, "Server Error")
		return
	}
	c.JSON(http.StatusCreated, gin.H{
		"status": "ok",
	})
}

func UserDelete(c *gin.Context) {
	id := c.PostForm("id")
	intId, err := strconv.ParseInt(id, 10, 0)
	if err != nil {
		c.String(http.StatusBadRequest, "Bad request")
		return
	}
	userService := service.UserService{}
	err = userService.DeleteUser(int(intId))
	if err != nil {
		c.String(http.StatusInternalServerError, "Server Error")
		return
	}
	c.JSON(http.StatusCreated, gin.H{
		"status": "ok",
	})
}
