//
//  CreateProduct.swift
//  ECommerceApp
//
//  Created by Walid SASSI on 02/10/2024.
//
import Vapor
import Fluent

struct CreationProduct: Migration {

    func prepare(on database: Database) -> EventLoopFuture<Void> {

        database.schema("products")
            .id()
            .field("name", .string, .required)
            .field("price", .double, .required)
            .field("quantity", .int, .required)
            .field("description", .string)
            .field("category", .string, .required)
            .create()

    }

    func revert(on database: any Database) -> EventLoopFuture<Void> {

        database.schema("products").delete()

    }

}
