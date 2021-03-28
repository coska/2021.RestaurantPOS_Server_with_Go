package main

// import "github.com/gofiber/fiber/v2@2.6.0"
import (
	"RestaurantPOSServer/dao/factory"
	"RestaurantPOSServer/utilities"
	"log"

	"github.com/gofiber/fiber/v2"
)

func main() {
	config, err := utilities.GetConfiguration()
	if err != nil {
		log.Fatal(err)
		return
	}

	app := fiber.New()

	// Static resources
	app.Static("/", "./webapp/index.html")

	app.Get("/hello", func(c *fiber.Ctx) error {
		return c.SendString("Hello, World! 3")
	})

	api := app.Group("/api")                          // /api
	v1 := api.Group("/v1", func(c *fiber.Ctx) error { // middleware for /api/v1
		c.Set("Version", "v1")
		return c.Next()
	}) // /api/v1

	userDao := factory.FactoryDao(config.Engine)

	v1.Get("/employee", func(c *fiber.Ctx) error {
		//emps := make([]*models.Employee, 0)
		emps, error := userDao.GetAll()

		if error != nil {
			return error
		}

		return c.Status(fiber.StatusOK).JSON(emps)
	})
	v1.Get("/employee/*", func(c *fiber.Ctx) error {
		emp, error := userDao.GetById(c.Params("*"))
		if error != nil {
			return error
		}

		return c.Status(fiber.StatusOK).JSON(emp)

	})

	log.Fatal(app.Listen(":3000"))

}
