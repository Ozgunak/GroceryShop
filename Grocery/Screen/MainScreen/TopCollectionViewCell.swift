//
//  TopCollectionViewCell.swift
//  Grocery
//
//  Created by ozgun on 17.02.2022.
//

import UIKit

class TopCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var topImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        topView.addShadowAndCornerRadius()
//        topView.layer.cornerRadius = topView.bounds.height / 10
//        topView.layer.shadowOpacity = 1
//        topView.layer.shadowOffset = CGSize.zero
//        topView.layer.shadowColor = UIColor.darkGray.cgColor

        topImage.addShadowAndCornerRadius()
//        topImage.layer.cornerRadius = 10
//        topImage.layer.shadowOpacity = 1
//        topImage.layer.shadowOffset = CGSize.zero
//        topImage.layer.shadowColor = UIColor.darkGray.cgColor

    }

}
