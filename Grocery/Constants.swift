//
//  Constants.swift
//  Grocery
//
//  Created by ozgun on 17.02.2022.
//

import Foundation

struct K {
    static let TopCollectionViewCell = "TopCollectionViewCell"
    static let topCell = "topCell"
    static let MidCollectionViewCell = "MidCollectionViewCell"
    static let midCell = "midCell"
    static let BottomCollectionViewCell = "BottomCollectionViewCell"
    static let botCell = "botCell"
    static let CategoryCollectionViewCell = "CategoryCollectionViewCell"
    static let categoryCell = "categoryCell"
    static let ItemsCollectionViewCell = "ItemsCollectionViewCell"
    static let itemCell = "itemCell"
    static let CartTableViewCell = "CartTableViewCell"
    static let cartCell = "cartCell"
    static let CheckoutTableViewCell = "CheckoutTableViewCell"
    static let checkoutCell = "checkoutCell"
    
    struct segues {
        static let detailScreenSeque = "detailScreenSeque"
        static let categoryScreenSeque = "categoryScreenSeque"
        static let categoryToDetail = "CategoryToDetail"
        static let mainToCartSegue = "mainToCartSegue"
        static let categoryToCart = "categoryToCart"
        static let mainToProfileSegue = "mainToProfileSegue"
        static let cartToCheckoutSegue = "cartToCheckoutSegue"
    }
    
}
