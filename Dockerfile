# Start with a minimal base image for Go
FROM golang:1.22-alpine as builder

# Set the working directory
WORKDIR /app

# Copy go.mod and go.sum and download dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the application code
COPY . .

# Build the application binary
RUN go build -o fiber-app .

# Create a new stage for the final image
FROM alpine:latest

# Install SSL certificates for HTTPS connections
RUN apk --no-cache add ca-certificates

# Set the working directory in the final container
WORKDIR /root/

# Copy the compiled binary from the builder stage
COPY --from=builder /app/fiber-app .

# Expose the application port
EXPOSE 8080

# Command to run the application
CMD ["./fiber-app"]
