//
//  User.swift
//  ECommerceApp
//
//  Created by Walid SASSI on 06/10/2024.
//
import Vapor
import Fluent

final class User: Model, Content {
    static let schema = "users"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "userName")
    var userName: String
    
    @Children(for: \.$user)
    var baskets: [Basket]
    
    init() {}
    
    init(id: UUID? = nil, userName: String) {
        self.id = id

        self.userName = userName
    }
}
