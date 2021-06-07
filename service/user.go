package service

import (
	"swistory/api/db"
	"swistory/api/model"

	"golang.org/x/crypto/bcrypt"
)

type UserService struct{}

func (UserService) CreateUser(user *model.User) error {
	db := db.GetDB()
	hashed, _ := bcrypt.GenerateFromPassword([]byte(user.Password), 10)
	user.Password = string(hashed)
	err := db.Create(&user).Error
	if err != nil {
		return err
	}
	return nil
}

func (UserService) GetUser(email string) model.User {
	var test model.User
	db := db.GetDB()
	result := db.Where("email = ?", email).First(&test)
	if result.Error != nil {
		panic(result.Error)
	}
	return test
}

func (UserService) GetUserList() []model.User {
	tests := make([]model.User, 0)
	db := db.GetDB()
	result := db.Distinct("id", "level", "aim", "description").Limit(10).Find(&tests)
	if result.Error != nil {
		panic(result.Error)
	}
	return tests
}

func (UserService) UpdateUser(newUser *model.User) error {
	db := db.GetDB()
	result := db.First(&newUser)
	if result.Error != nil {
		return result.Error
	}
	return nil
}

func (UserService) DeleteUser(id int) error {
	db := db.GetDB()
	result := db.Delete(&model.User{}, id)
	if result.Error != nil {
		return result.Error
	}
	return nil
}
