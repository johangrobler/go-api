package main

import (
	"github.com/gofiber/fiber/v2"
)

func main() {
	app := fiber.New()
	app.Get("/", func(c *fiber.Ctx) error {
		return c.SendString("Hello, World!")
	})
	app.Get("/up", func(c *fiber.Ctx) error {
		return c.JSON(fiber.Map{"status": "up"})
	})
	// run app
	app.Listen(":8080")
}
