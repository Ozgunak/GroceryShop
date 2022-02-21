//
//  CartModel.swift
//  Grocery
//
//  Created by ozgun on 18.02.2022.
//

import Foundation

class CartModel {
    let item: ItemModel
    var quantity: Int
    
    init(item: ItemModel, quantity: Int) {
        self.item = item
        self.quantity = quantity
    }
}
