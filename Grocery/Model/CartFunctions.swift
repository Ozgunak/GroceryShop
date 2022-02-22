//
//  CartFunctions.swift
//  Grocery
//
//  Created by ozgun on 21.02.2022.
//

import Foundation

class CartFunctions {
    static var cartItems: [CartModel] = []
    
    static func addItem(item: CartModel) {
        if cartItems.contains(where: { $0.item == item.item}) {
            chanceQuantity(item: item, newQuantity: item.quantity)
        } else {
            cartItems.append(item)
        }
    }
    static func deleteItem(item: CartModel) {
        if let index = cartItems.lastIndex(where: { $0.item == item.item}) {
            cartItems.remove(at: index)
        }
    }
    
    static func chanceQuantity(item: CartModel, newQuantity: Int) {
        if let index = cartItems.lastIndex(where: { $0.item == item.item}) {
            cartItems[index].quantity = newQuantity
        }
    }
    static func calculateCart() -> Double {
        var total = 0.0
        cartItems.forEach { item in
            let itemPrice = item.item.price * Double(item.quantity)
            total = total + itemPrice
        }
        return total
    }
    
}
