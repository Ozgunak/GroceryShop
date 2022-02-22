//
//  BottomCollectionViewCell.swift
//  Grocery
//
//  Created by ozgun on 18.02.2022.
//

import UIKit

class BottomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var discountedPrice: UILabel!
    @IBOutlet weak var normalPrice: UILabel!
    @IBOutlet weak var botImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        botImageView.layer.cornerRadius = 10
        botImageView.backgroundColor = .red
    }
    
    func setupBot(item: ItemModel){
        botImageView.image = item.image
        discountedPrice.text = String(format: "%.2f" , item.price)
        normalPrice.text = String(format: "%.2f" , item.price * 1.25)
    }

}
