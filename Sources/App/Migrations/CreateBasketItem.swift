//
//  CreateBasketItem.swift
//  ECommerceApp
//
//  Created by Walid SASSI on 06/10/2024.
//
import Vapor
import Fluent

struct CreateBasketItem: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {

        database.schema("basket_items")
            .id()
            .field("basket_id", .uuid, .required, .references("baskets", "id", onDelete: .cascade))
            .field("product_id", .uuid, .required, .references("products", "id", onDelete: .cascade))
            .field("quantity", .int, .required)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {

        database.schema("basket_items").delete()
    }

}
