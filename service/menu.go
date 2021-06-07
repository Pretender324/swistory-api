package service

import (
	"swistory/api/db"
	"swistory/api/model"
)

type MenuService struct{}

func (MenuService) SetMenu(menu *model.Menu) error {
	db := db.GetDB()
	err := db.Create(&menu).Error
	if err != nil {
		return err
	}
	return nil
}

func (MenuService) GetMenuList() []model.Menu {
	tests := make([]model.Menu, 0)
	db := db.GetDB()
	result := db.Distinct("id", "level", "aim", "description").Limit(10).Find(&tests)
	if result.Error != nil {
		panic(result.Error)
	}
	return tests
}

func (MenuService) UpdateMenu(newMenu *model.Menu) error {
	db := db.GetDB()
	result := db.First(&newMenu)
	if result.Error != nil {
		return result.Error
	}
	return nil
}

func (MenuService) DeleteMenu(id int) error {
	db := db.GetDB()
	result := db.Delete(&model.Menu{}, id)
	if result.Error != nil {
		return result.Error
	}
	return nil
}
