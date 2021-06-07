package model

import "gorm.io/gorm"

type User struct {
	gorm.Model
	Name     string
	Sex      string
	Email    string `form:"email" binding:"required" gorm:"unique;not null"`
	Password string `form:"password" binding:"required"`
	GroupID  uint
}
