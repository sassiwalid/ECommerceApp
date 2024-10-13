import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get("hello") { req in
        "Hello, world!"
    }
    
    try app.register(collection: ProductController())
    
    try app.register(collection: BasketController())
    
    try app.register(collection: UserController())

}
