package service

import (
	"swistory/api/db"
	"swistory/api/model"
)

type GroupService struct{}

func (GroupService) SetGroup(group *model.Group) error {
	db := db.GetDB()
	err := db.Create(&group).Error
	if err != nil {
		return err
	}
	return nil
}

func (GroupService) GetGroup() model.Group {
	var test model.Group
	db := db.GetDB()
	result := db.First(&test)
	if result.Error != nil {
		panic(result.Error)
	}
	return test
}

func (GroupService) GetGroupList() []model.Group {
	tests := make([]model.Group, 0)
	db := db.GetDB()
	result := db.Distinct("id", "level", "aim", "description").Limit(10).Find(&tests)
	if result.Error != nil {
		panic(result.Error)
	}
	return tests
}

func (GroupService) UpdateGroup(newGroup *model.Group) error {
	db := db.GetDB()
	result := db.First(&newGroup)
	if result.Error != nil {
		return result.Error
	}
	return nil
}

func (GroupService) DeleteGroup(id int) error {
	db := db.GetDB()
	result := db.Delete(&model.Group{}, id)
	if result.Error != nil {
		return result.Error
	}
	return nil
}
