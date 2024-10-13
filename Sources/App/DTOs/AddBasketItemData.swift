//
//  AddBasketItemData.swift
//  ECommerceApp
//
//  Created by Walid SASSI on 06/10/2024.
//
import Vapor
struct AddBasketItemData: Content {
    var userID: UUID
    var productID: UUID
    var quantity: Int
}

struct BasketItemResponse: Content {
    var id: UUID
    var productID: UUID
    var quantity: Int
    var price: Double
    var productName: String
}
