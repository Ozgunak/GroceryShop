//
//  ItemFunctions.swift
//  Grocery
//
//  Created by ozgun on 18.02.2022.
//

import Foundation
import UIKit

struct ItemFunctions {
    static var fruitItems = [ItemModel]()
    static var drinkItems = [ItemModel]()
    static var snackItems = [ItemModel]()
    static var bakeryItems = [ItemModel]()
    static var milkyItems = [ItemModel]()
    
    static func createItem(item: ItemModel) {
        fruitItems.append(item)
    }
    
    static func readItems(complation: @escaping () -> Void) {
        DispatchQueue.main.async {
            if fruitItems.isEmpty {
                fruitItems.append(ItemModel(title: "Muz", image: UIImage(named: "muz")!, price: 16.8))
                fruitItems.append(ItemModel(title: "Elma", image: UIImage(named: "elma")!, price: 10.24))
                fruitItems.append(ItemModel(title: "Çilek", image: UIImage(named: "cilek")!, price: 24.27))
                fruitItems.append(ItemModel(title: "Portakal", image: UIImage(named: "portakal")!, price: 10.24))
                fruitItems.append(ItemModel(title: "Kivi", image: UIImage(named: "kivi")!, price: 20))
                fruitItems.append(ItemModel(title: "Avokado", image: UIImage(named: "avokado")!, price: 30))
                fruitItems.append(ItemModel(title: "Kiraz", image: UIImage(named: "kiraz")!, price: 50))
            }
            if drinkItems.isEmpty {
                drinkItems.append(ItemModel(title: "Su", image: UIImage(named: "su")!, price: 1))
                drinkItems.append(ItemModel(title: "Kola", image: UIImage(named: "kola")!, price: 7.65))
                drinkItems.append(ItemModel(title: "Limonata", image: UIImage(named: "limonata")!, price: 9.5))
                drinkItems.append(ItemModel(title: "Portakal", image: UIImage(named: "portakalsuyu")!, price: 12.3))
                drinkItems.append(ItemModel(title: "Soda", image: UIImage(named: "soda")!, price: 2.5))
            }
            if snackItems.isEmpty {
                snackItems.append(ItemModel(title: "Luppo", image: #imageLiteral(resourceName: "s1.png"), price: 9.2))
                snackItems.append(ItemModel(title: "Ülker Beyaz", image: #imageLiteral(resourceName: "s2.png"), price: 10.2))
                snackItems.append(ItemModel(title: "Ülker Golden", image: #imageLiteral(resourceName: "s3.png"), price: 7.6))
                snackItems.append(ItemModel(title: "Goldiva", image: #imageLiteral(resourceName: "s4.png"), price: 12.0))
                snackItems.append(ItemModel(title: "Rulokat", image: #imageLiteral(resourceName: "s5.png"), price: 13.0))
                snackItems.append(ItemModel(title: "Nogger", image: #imageLiteral(resourceName: "s6.png"), price: 7.0))
                snackItems.append(ItemModel(title: "Tadım Çekirdek", image: #imageLiteral(resourceName: "s7.png"), price: 8.2))
                snackItems.append(ItemModel(title: "Tadım Çekirdek", image: #imageLiteral(resourceName: "s8.png"), price: 8.2))
                snackItems.append(ItemModel(title: "Rulokat", image: #imageLiteral(resourceName: "s9.png"), price: 10.2))
            }
            if bakeryItems.isEmpty {
                bakeryItems.append(ItemModel(title: "Su", image: #imageLiteral(resourceName: "b1.png"), price: 10))
                bakeryItems.append(ItemModel(title: "Su", image: #imageLiteral(resourceName: "b2.png"), price: 10))
                bakeryItems.append(ItemModel(title: "Su", image: #imageLiteral(resourceName: "b3.png"), price: 10))
                bakeryItems.append(ItemModel(title: "Su", image: #imageLiteral(resourceName: "b4.png"), price: 10))
                bakeryItems.append(ItemModel(title: "Su", image: #imageLiteral(resourceName: "b5.png"), price: 10))
                bakeryItems.append(ItemModel(title: "Su", image: #imageLiteral(resourceName: "b6.png"), price: 10))
                bakeryItems.append(ItemModel(title: "Su", image: #imageLiteral(resourceName: "b7.png"), price: 10))
                bakeryItems.append(ItemModel(title: "Su", image: #imageLiteral(resourceName: "b8.png"), price: 10))
                bakeryItems.append(ItemModel(title: "Su", image: #imageLiteral(resourceName: "b9.png"), price: 10))

            }
            let foto = (1...9).map { UIImage(named: "m\($0)")! }
            let name = ["Ciabatta", "Zeytinli Ekmek", "Vollgut", "Buğday Ekmekği", "Mayalı Köy", "Baget", "Mor Ekmek", "Simit", "Simit"]
            let price = [6.4, 13.9, 23.2, 28.9, 22.4, 5.9, 6.9, 3.25, 4.4]
            
            if milkyItems.isEmpty {
                for index in 0...8 {
                    milkyItems.append(ItemModel(title: name[index], image: foto[index], price: price[index]))
                }
            }
            complation()
        }
    }
}
