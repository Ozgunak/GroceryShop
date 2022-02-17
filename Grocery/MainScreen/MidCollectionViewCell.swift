//
//  MidCollectionViewCell.swift
//  Grocery
//
//  Created by ozgun on 17.02.2022.
//

import UIKit

class MidCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var midLabel: UILabel!
    @IBOutlet weak var midImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        midImageView.layer.cornerRadius = 10
        midImageView.backgroundColor = .red
    }

}
