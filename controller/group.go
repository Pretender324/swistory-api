package controller

import (
	"net/http"
	"strconv"
	"swistory/api/model"
	"swistory/api/service"

	"github.com/gin-gonic/gin"
)

func GroupAdd(c *gin.Context) {
	group := model.Group{}
	err := c.Bind(&group)
	if err != nil {
		c.String(http.StatusBadRequest, "Bad request")
		return
	}
	groupService := service.GroupService{}
	err = groupService.SetGroup(&group)
	if err != nil {
		c.String(http.StatusInternalServerError, "Server Error", err)
		return
	}
	c.JSON(http.StatusCreated, gin.H{
		"status": "ok",
	})
}

func GroupList(c *gin.Context) {
	GroupService := service.GroupService{}
	GroupLists := GroupService.GetGroupList()
	c.JSONP(http.StatusOK, gin.H{
		"message": "ok",
		"data":    GroupLists,
	})
}

func GroupUpdate(c *gin.Context) {
	group := model.Group{}
	err := c.Bind(&group)
	if err != nil {
		c.String(http.StatusBadRequest, "Bad request")
		return
	}
	groupService := service.GroupService{}
	err = groupService.UpdateGroup(&group)
	if err != nil {
		c.String(http.StatusInternalServerError, "Server Error")
		return
	}
	c.JSON(http.StatusCreated, gin.H{
		"status": "ok",
	})
}

func GroupDelete(c *gin.Context) {
	id := c.PostForm("id")
	intId, err := strconv.ParseInt(id, 10, 0)
	if err != nil {
		c.String(http.StatusBadRequest, "Bad request")
		return
	}
	groupService := service.GroupService{}
	err = groupService.DeleteGroup(int(intId))
	if err != nil {
		c.String(http.StatusInternalServerError, "Server Error")
		return
	}
	c.JSON(http.StatusCreated, gin.H{
		"status": "ok",
	})
}
