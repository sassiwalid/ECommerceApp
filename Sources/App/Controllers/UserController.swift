//
//  UserController.swift
//  ECommerceApp
//
//  Created by Walid SASSI on 12/10/2024.
//

import Vapor

struct UserController: RouteCollection {

    func boot(routes: RoutesBuilder) throws {

        let users = routes.grouped("users")

        users.post(use: create)

        users.get(use: index)

    }
    
    // Create a new User
    func create(_ req: Request) throws -> EventLoopFuture<User> {
        let user = try req.content.decode(User.self)
        return user.save(on: req.db).map { user }
    }
    
    // List all users
    func index(_ req: Request) throws -> EventLoopFuture<[User]> {
        User.query(on: req.db).all()
    }

}

