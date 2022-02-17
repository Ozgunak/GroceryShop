//
//  ItemFunctions.swift
//  Grocery
//
//  Created by ozgun on 18.02.2022.
//

import Foundation
import UIKit

struct FruitFunctions {
    static var items = [FruitModel]()
    
    static func createItem(item: FruitModel) {
        items.append(item)
    }
    
    static func readItems(complation: @escaping () -> Void) {
        DispatchQueue.main.async {
            if items.isEmpty {
                items.append(FruitModel(title: "Muz", image: UIImage(named: "muz")!))
                items.append(FruitModel(title: "Elma", image: UIImage(named: "elma")!))
                items.append(FruitModel(title: "Çilek", image: UIImage(named: "cilek")!))
                items.append(FruitModel(title: "Portakal", image: UIImage(named: "portakal")!))
                items.append(FruitModel(title: "Kivi", image: UIImage(named: "kivi")!))
                items.append(FruitModel(title: "Avokado", image: UIImage(named: "avokado")!))
                items.append(FruitModel(title: "Kiraz", image: UIImage(named: "kiraz")!))
            }
            complation()
        }
    }
}
