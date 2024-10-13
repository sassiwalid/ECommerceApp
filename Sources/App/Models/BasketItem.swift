//
//  BasketItem.swift
//  ECommerceApp
//
//  Created by Walid SASSI on 06/10/2024.
//
import Vapor
import Fluent

final class BasketItem: Model, Content {
    static let schema = "basket_items"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "basket_id")
    var basket: Basket

    @Parent(key: "product_id")
    var product: Product

    @Field(key: "quantity")
    var quantity: Int
    
    init() {}
    
    init(id: UUID? = nil, basketID: UUID, productID: UUID, quantity: Int) {

        self.id = id
        
        self.$basket.id = basketID
        
        self.$product.id = productID
        
        self.quantity = quantity
    }

}
