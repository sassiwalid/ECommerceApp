# Use the official Swift image
FROM swift:5.6 as build

# Set the working directory
WORKDIR /app

# Copy the project files to the container
COPY . .

# Build the project in release mode
RUN swift build --configuration release

# Run stage: copy the built executable to a new image
FROM ubuntu:20.04
WORKDIR /app

# Copy the built executable from the build image
COPY --from=build /app/.build/release/Run /app/Run

# Expose the port your app runs on
EXPOSE 8080

# Set the default command to run your Vapor app
CMD ["/app/Run", "serve", "--hostname", "0.0.0.0", "--port", "8080"]
