//
//  CartViewController.swift
//  Grocery
//
//  Created by ozgun on 21.02.2022.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var emptyCartImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: K.CartTableViewCell, bundle: nil), forCellReuseIdentifier: K.cartCell)
        emptyCartImage.isHidden = CartFunctions.cartItems.isEmpty ? false : true
    }
    

    @IBAction func checkOutButtonPressed(_ sender: UIButton) {
        
    }
    
}


extension CartViewController: UITableViewDelegate {
    
}

extension CartViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CartFunctions.cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cartCell, for: indexPath) as! CartTableViewCell
        cell.setCartItem(cart: CartFunctions.cartItems[indexPath.row])
        cell.increasePressed = {
            CartFunctions.addItem(item: CartModel(item: CartFunctions.cartItems[indexPath.row].item, quantity: CartFunctions.cartItems[indexPath.row].quantity + 1))
            self.tableView.reloadData()
        }
        cell.decreasePressed = {
                if CartFunctions.cartItems[indexPath.row].quantity > 0 {
                    CartFunctions.addItem(item: CartModel(item: CartFunctions.cartItems[indexPath.row].item, quantity: CartFunctions.cartItems[indexPath.row].quantity - 1))
                    self.tableView.reloadData()
                }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(96)
    }
    
}
