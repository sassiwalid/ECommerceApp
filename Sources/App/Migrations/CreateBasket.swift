//
//  CreateBasket.swift
//  ECommerceApp
//
//  Created by Walid SASSI on 06/10/2024.
//
import Vapor
import Fluent

struct CreateBasket: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {

        database.schema("baskets")
            .id()
            .field("user_id", .uuid, .required, .references("users", "id", onDelete: .cascade))
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {

        database.schema("baskets").delete()
    }
}
