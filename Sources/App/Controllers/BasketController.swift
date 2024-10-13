//
//  BasketController.swift
//  ECommerceApp
//
//  Created by Walid SASSI on 06/10/2024.
//
import Fluent
import Vapor

struct BasketController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let basketRoutes = routes.grouped("basket")
        
        basketRoutes.post("add", use: addItem)
        
        basketRoutes.get("view",":userId", use: viewBasket)
        
    }
    
    func addItem(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        
        let addItemData = try req.content.decode(AddBasketItemData.self)
        
        return Basket.query(on: req.db)
            .filter(\.$user.$id == addItemData.userID)
            .first()
            .flatMap { existingBasket in
                let basketFuture: EventLoopFuture<Basket>
                if let basket  = existingBasket {

                    basketFuture = req.eventLoop.future(basket)
                } else {
                    let newBasket = Basket(userID: addItemData.userID)

                    basketFuture = newBasket.save(on: req.db).map { newBasket }
                }

                return basketFuture.flatMap { basket in
                    return BasketItem.query(on: req.db)
                        .filter(\.$basket.$id == basket.id!)
                        .filter(\.$product.$id == addItemData.productID)
                        .first()
                        .flatMap { existingItem in
                            if let existingItem = existingItem {
                                existingItem.quantity += addItemData.quantity
                                return existingItem.save(on: req.db).transform(to: .ok)
                            } else {
                                let newItem = BasketItem(
                                    basketID: basket.id!,
                                    productID: addItemData.productID,
                                    quantity: addItemData.quantity
                                )
                                
                                return newItem.save(on: req.db).transform(to: .ok)
                                
                            }
                        }
                }
            }
            
    }

    func viewBasket(req:Request) throws -> EventLoopFuture<[BasketItemResponse]> {

        guard let userIDString = req.parameters.get("userId"),
              let userID = UUID(uuidString: userIDString)
        else {
            throw Abort(.badRequest, reason: "userID is missing")
        }

        return Basket.query(on:req.db)
            .filter(\.$user.$id == userID)
            .with(\.$items) { item in
                item.with(\.$product)
            }
            .first()
            .unwrap(or: Abort(.notFound, reason: "Cart not found for this userID: \(userID)"))
            .map { basket in
                basket.items.map { item in
                    BasketItemResponse(
                        id: item.id!,
                        productID: item.$product.id,
                        quantity: item.quantity,
                        price: item.product.price,
                        productName: item.product.name
                    )
                }
            }
        
    }
    
    
}
