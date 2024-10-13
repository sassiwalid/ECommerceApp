//
//  Product.swift
//  ECommerceApp
//
//  Created by Walid SASSI on 02/10/2024.
//
import Fluent
import Vapor

final class Product: Model, Content {
    static let schema: String = "products"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "name")
    var name: String

    @Field(key: "price")
    var price: Double

    @Field(key: "description")
    var description: String

    @Field(key: "category")
    var category: String

    @Field(key: "quantity")
    var quantity: Int

    init() {}

    init(id: UUID? = nil, name: String, price: Double, description: String, category: String, quantity: Int) {

        self.id = id

        self.name = name

        self.price = price

        self.description = description

        self.category = category

        self.quantity = quantity

    }

}

