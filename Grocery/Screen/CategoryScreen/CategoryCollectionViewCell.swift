//
//  CategoryCollectionViewCell.swift
//  Grocery
//
//  Created by ozgun on 20.02.2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var selectedImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        categoryImage.addShadowAndCornerRadius()
        selectedImage.cornerRadius = 10
    }

}
