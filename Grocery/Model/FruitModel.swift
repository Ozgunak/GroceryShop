//
//  Item.swift
//  Grocery
//
//  Created by ozgun on 18.02.2022.
//

import Foundation
import UIKit

struct FruitModel {
    let id: UUID
    let title: String
    let image: UIImage
    
    init(title: String, image: UIImage) {
        id = UUID()
        self.title = title
        self.image = image
    }
}
