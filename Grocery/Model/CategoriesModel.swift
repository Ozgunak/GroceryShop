//
//  CategoriesModel.swift
//  Grocery
//
//  Created by ozgun on 18.02.2022.
//

import Foundation

struct CategoriesModel {
    struct Drink {
        let id: UUID
        let title: String
        
        init(title: String) {
            id = UUID()
            self.title = title
        }
    }
    struct IceCream {
        let id: UUID
        let title: String
        
        init(title: String) {
            id = UUID()
            self.title = title
        }
    }
    struct Bakery {
        let id: UUID
        let title: String
        
        init(title: String) {
            id = UUID()
            self.title = title
        }
    }
    struct Breakfast {
        let id: UUID
        let title: String
        
        init(title: String) {
            id = UUID()
            self.title = title
        }
    }
    struct Form {
        let id: UUID
        let title: String
        
        init(title: String) {
            id = UUID()
            self.title = title
        }
    }
}


