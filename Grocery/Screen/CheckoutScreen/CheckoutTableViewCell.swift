//
//  CheckoutTableViewCell.swift
//  Grocery
//
//  Created by ozgun on 23.02.2022.
//

import UIKit

class CheckoutTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var optionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(name: String, option: String) {
        nameLabel.text = name
        optionLabel.text = option
    }
    
}
