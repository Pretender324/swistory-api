package db

import (
	"fmt"
	"os"
	"swistory/api/model"

	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

var (
	db *gorm.DB
)

func Init() {

	if gin.Mode() == "debug" {
		os.Setenv("GO_ENV", "development")
	}

	err := godotenv.Load(fmt.Sprintf("./.env.%s", os.Getenv("GO_ENV")))
	if err != nil {
		// .env読めなかった場合の処理
		panic(err.Error())
	}

	DB_USER := os.Getenv("DB_USER")
	DB_PASS := os.Getenv("DB_PASS")
	DB_PORT := os.Getenv("DB_PORT")
	DB_NAME := os.Getenv("DB_NAME")

	dsn := DB_USER + ":" + DB_PASS + "@" + DB_PORT + "/" + DB_NAME + "?charset=utf8&parseTime=true"
	db, err = gorm.Open(mysql.Open(dsn), &gorm.Config{})
	if err != nil {
		panic(err.Error())
	}
	fmt.Println("db connected: ", &db)
	db.AutoMigrate(&model.Menu{})
	autoMigration()
}

// DB取得
func GetDB() *gorm.DB {
	return db
}

// マイグレーション
func autoMigration() {
	db.AutoMigrate(&model.Menu{})
	db.AutoMigrate(&model.User{})
}
