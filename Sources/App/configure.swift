import NIOSSL
import Fluent
import FluentMySQLDriver
import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.mysql(
        hostname: Environment.get("RDS_HOST") ?? "127.0.0.1",
        username: Environment.get("RDS_USER") ?? "root",
        password: Environment.get("RDS_PASSWORD") ?? "1234",
        database: Environment.get("RDS_DATABASE") ?? "ecommerce_db",
        tlsConfiguration: .forClient(certificateVerification: .none)
    ), as: .mysql)

    app.views.use(.leaf)
    
    app.migrations.add(CreationProduct())
    app.migrations.add(CreateUser())
    app.migrations.add(CreateBasket())
    app.migrations.add(CreateBasketItem())


    // register routes
    try routes(app)
}
