//
//  CreateUser.swift
//  ECommerceApp
//
//  Created by Walid SASSI on 06/10/2024.
//
import Vapor
import Fluent

struct CreateUser: Migration {

    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("users")
            .id()
            .field("username", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("users").delete()
    }
}
