//
//  Item.swift
//  Grocery
//
//  Created by ozgun on 18.02.2022.
//

import Foundation
import UIKit

struct ItemModel: Equatable {
    let id: UUID
    let title: String
    let image: UIImage
    let price: Double
    
    init(title: String, image: UIImage, price: Double) {
        id = UUID()
        self.title = title
        self.image = image
        self.price = price
    }
}
