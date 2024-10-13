//
//  ProductController.swift
//  ECommerceApp
//
//  Created by Walid SASSI on 02/10/2024.
//
import Vapor

struct ProductController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let products = routes.grouped("products")

        products.get(use: index)
        
        products.post(use: create)

    }

    // List all products
    func index(_ req: Request) throws -> EventLoopFuture<[Product]> {
        Product.query(on: req.db).all()
    }
    
    // Create a new product
    func create(_ req: Request) throws -> EventLoopFuture<Product> {
        let product = try req.content.decode(Product.self)
        return product.save(on: req.db).map { product}
    }
    

}

