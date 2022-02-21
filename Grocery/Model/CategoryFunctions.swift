//
//  CategoryFunctions.swift
//  Grocery
//
//  Created by ozgun on 18.02.2022.
//

import Foundation
import UIKit

struct CategoryFunctions {
    static var categories = [CategoriesModel]()
    
    static func createCategory(item: CategoriesModel) {
        categories.append(item)
    }
    
    static func readCategories(complation: @escaping () -> Void) {
        DispatchQueue.main.async {
            if categories.isEmpty {
                categories.append(CategoriesModel(categoryName: "Fruits", categoryImage: UIImage(named: "fruitsCategory")!, items: ItemFunctions.fruitItems))
                categories.append(CategoriesModel(categoryName: "Drinks", categoryImage: UIImage(named: "grup")!, items: ItemFunctions.drinkItems))
                categories.append(CategoriesModel(categoryName: "Bakery", categoryImage: #imageLiteral(resourceName: "bakery.png"), items: ItemFunctions.bakeryItems))
                categories.append(CategoriesModel(categoryName: "Snacks", categoryImage: #imageLiteral(resourceName: "snacks.png"), items: ItemFunctions.snackItems))
                categories.append(CategoriesModel(categoryName: "Diary", categoryImage: #imageLiteral(resourceName: "sut.png"), items: ItemFunctions.milkyItems))
                categories.append(CategoriesModel(categoryName: "Breakfast", categoryImage: #imageLiteral(resourceName: "kahvalti.png"), items: ItemFunctions.bakeryItems))
                categories.append(CategoriesModel(categoryName: "Ice Cream", categoryImage: #imageLiteral(resourceName: "dondurma.png"), items: ItemFunctions.drinkItems))
                categories.append(CategoriesModel(categoryName: "Home Products", categoryImage: #imageLiteral(resourceName: "evbakim.png"), items: ItemFunctions.drinkItems))
                categories.append(CategoriesModel(categoryName: "Fit", categoryImage: #imageLiteral(resourceName: "fit.png"), items: ItemFunctions.drinkItems))
                categories.append(CategoriesModel(categoryName: "Personal Care", categoryImage: #imageLiteral(resourceName: "kisisel.png"), items: ItemFunctions.drinkItems))
                categories.append(CategoriesModel(categoryName: "Base Food", categoryImage: #imageLiteral(resourceName: "temel.png"), items: ItemFunctions.drinkItems))
                categories.append(CategoriesModel(categoryName: "Sandwiches", categoryImage: #imageLiteral(resourceName: "yiyecek.png"), items: ItemFunctions.drinkItems))

            }
            complation()
        }
    }
}
