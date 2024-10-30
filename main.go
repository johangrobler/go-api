package main

import (
	"github.com/gofiber/fiber/v2"
)

func main() {
	//create app
	app := fiber.New()

	app.Get("/", func(c *fiber.Ctx) error {
		return c.SendString("Hello, World!")
	})

	// run app
	app.Listen(":8080")
}
