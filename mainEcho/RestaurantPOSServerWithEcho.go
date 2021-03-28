package main

import (
	"RestaurantPOSServer/dao/factory"
	"RestaurantPOSServer/models"
	"RestaurantPOSServer/utilities"
	"log"
	"net/http"

	"github.com/labstack/echo"
	"github.com/labstack/echo/middleware"
	_ "github.com/lib/pq"
)

func main() {

	config, err := utilities.GetConfiguration()
	if err != nil {
		log.Fatal(err)
		return
	}

	e := echo.New()

	e.Use(middleware.Logger())
	e.Use(middleware.Recover())

	userDao := factory.FactoryDao(config.Engine)

	e.GET("/employee/:userid", func(c echo.Context) error {
		userid := c.Param("userid")
		emp, error := userDao.GetById(userid)
		if error != nil {
			return error
		}

		return c.JSON(http.StatusCreated, emp)
	})

	e.PUT("/employee", func(c echo.Context) error {
		u := new(models.Employee)

		if err := c.Bind(u); err != nil {
			return err
		}

		// sqlStatement := "UPDATE employee SET updatedat=now(), username=$2 WHERE userid=$1"
		// res, err := db.Query(sqlStatement, u.UserId, u.FirstName)
		// if err != nil {
		// 	fmt.Println(err)
		// } else {
		// 	fmt.Println(res)
		// 	return c.JSON(http.StatusCreated, u)
		// }
		// return c.String(http.StatusOK, u.Userid)
		return nil
	})

	e.POST("/employee", func(c echo.Context) error {
		u := new(models.Employee)
		if err := c.Bind(u); err != nil {
			return err
		}
		// sqlStatement := "INSERT INTO employee (userid, createdat, updatedat, username) VALUES ($1, now(), now(), $2)"
		// res, err := db.Query(sqlStatement, u.Userid, u.Username)
		// if err != nil {
		// 	fmt.Println(err)
		// } else {
		// 	fmt.Println("hello")
		// 	fmt.Println(res)

		// 	return c.JSON(http.StatusCreated, u)
		// }
		// return c.String(http.StatusOK, "ok")
		return nil
	})

	e.Logger.Fatal(e.Start(":1800"))

}
