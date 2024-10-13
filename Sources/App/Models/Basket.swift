//
//  Basket.swift
//  ECommerceApp
//
//  Created by Walid SASSI on 06/10/2024.
//

import Vapor
import Fluent

final class Basket: Model, Content {
    
    static let schema = "baskets"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "user_id")
    var user: User
    
    @Children(for: \.$basket)
    var items: [BasketItem]
    
    init() {}
    
    init(id: UUID? = nil, userID: UUID) {
        self.id = id
        
        self.$user.id = userID
    }
}
