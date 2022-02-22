//
//  CartTableViewCell.swift
//  Grocery
//
//  Created by ozgun on 21.02.2022.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var cartItemPrice: UILabel!
    @IBOutlet weak var cartItemQuantity: UILabel!
    @IBOutlet weak var cartItemTitle: UILabel!
    @IBOutlet weak var cartItemImage: UIImageView!
    
    var quantity = 1
    var increasePressed: (() -> ()) = {}
    var decreasePressed: (() -> ()) = {}
    var deletePressed: (() -> ()) = {}

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cartItemImage.addShadowAndCornerRadius()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCartItem(cart: CartModel) {
        cartItemImage.image = cart.item.image
        cartItemTitle.text = cart.item.title
        cartItemQuantity.text = String(cart.quantity)
        let price = cart.item.price * Double(cart.quantity)
        cartItemPrice.text = String(format: "%.2f", price)
    }
    
    @IBAction func removePressed(_ sender: UIButton) {
        deletePressed()
    }
    
    @IBAction func plusPressed(_ sender: UIButton) {
        increasePressed()
    }
    
    @IBAction func minusPressed(_ sender: UIButton) {
        decreasePressed()
    }
    
}
