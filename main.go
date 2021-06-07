package main

import (
	"swistory/api/controller"
	"swistory/api/db"
	"swistory/api/middleware"

	"github.com/gin-gonic/gin"
	_ "gorm.io/driver/mysql"
)

func main() {
	engine := gin.Default()
	engine.Use(middleware.RecordUaAndTime)
	db.Init()

	v1 := engine.Group("/v1")
	{
		menuEngine := v1.Group("/menu")
		{
			menuEngine.POST("/add", controller.MenuAdd)
			menuEngine.GET("/list", controller.MenuList)
			menuEngine.PUT("/update", controller.MenuUpdate)
			menuEngine.DELETE("/delete", controller.MenuDelete)

		}
		userEngine := v1.Group("/user")
		{
			userEngine.POST("/signup", controller.UserAdd)
			userEngine.POST("/login", controller.UserLogin)
			userEngine.GET("/list", controller.UserList)
			userEngine.PUT("/update", controller.UserUpdate)
			userEngine.DELETE("/delete", controller.UserDelete)

		}

	}
	engine.Run(":5000") // listen and serve on 0.0.0.0:8080
}
