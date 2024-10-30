package main

import (
	"os"

	"github.com/gofiber/fiber/v2"
)

func main() {

	app := fiber.New()

	app.Get("/", func(c *fiber.Ctx) error {
		hostname, err := os.Hostname()
		if err != nil {

		}
		return c.SendString("Go fiber is running on: " + hostname)
	})

	app.Listen(":8080")
}
