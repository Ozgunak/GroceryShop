//
//  CartViewController.swift
//  Grocery
//
//  Created by ozgun on 21.02.2022.
//

import UIKit

class HalfSizePresentationController: UIPresentationController {
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let bounds = containerView?.bounds else { return .zero }
        return CGRect(x: 0, y: bounds.height / 2, width: bounds.width, height: bounds.height / 2)
    }
}
class CartViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var emptyCartImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    private var cartTotal: Double = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: K.CartTableViewCell, bundle: nil), forCellReuseIdentifier: K.cartCell)
        emptyCartImage.isHidden = CartFunctions.cartItems.isEmpty ? false : true
        updateTotal()
    }
    

    @IBAction func checkOutButtonPressed(_ sender: UIButton) {
//        performSegue(withIdentifier: K.segues.cartToCheckoutSegue, sender: self)
        let storyboard = UIStoryboard(name: "Checkout", bundle: nil)
        let pvc = storyboard.instantiateViewController(withIdentifier: "CheckoutSB")

                pvc.modalPresentationStyle = .custom
                pvc.transitioningDelegate = self

                present(pvc, animated: true)
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return HalfSizePresentationController(presentedViewController: presented, presenting: presentingViewController)
    }
    private func updateTotal() {
        let cartTotal = CartFunctions.calculateCart()
        totalLabel.text = String(format: "%.2f", cartTotal)
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
            self.updateTotal()
            self.tableView.reloadData()
        }
        cell.decreasePressed = {
                if CartFunctions.cartItems[indexPath.row].quantity > 0 {
                    CartFunctions.addItem(item: CartModel(item: CartFunctions.cartItems[indexPath.row].item, quantity: CartFunctions.cartItems[indexPath.row].quantity - 1))
                    self.updateTotal()
                    self.tableView.reloadData()
                }
        }
        cell.deletePressed = {
            CartFunctions.deleteItem(item: CartModel(item: CartFunctions.cartItems[indexPath.row].item, quantity: CartFunctions.cartItems[indexPath.row].quantity))
            self.updateTotal()
            self.tableView.reloadData()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(96)
    }
    
}
