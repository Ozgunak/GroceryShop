//
//  BottomCollectionViewCell.swift
//  Grocery
//
//  Created by ozgun on 18.02.2022.
//

import UIKit

class BottomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var botImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        botImageView.layer.cornerRadius = 10
        botImageView.backgroundColor = .red
    }

}
