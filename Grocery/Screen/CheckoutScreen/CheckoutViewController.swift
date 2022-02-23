//
//  CheckoutViewController.swift
//  Grocery
//
//  Created by ozgun on 23.02.2022.
//

import UIKit

class CheckoutViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    let names = ["Delivery", "Payment", "Promo Code", "Total Cost"]
    let options = ["Select Method", "💳", "Pick discount", "\(CartFunctions.calculateCart())₺"]
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: K.CheckoutTableViewCell, bundle: nil), forCellReuseIdentifier: K.checkoutCell)
//        self.view.cornerRadius = 50
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == K.segues.resultSegue {
//            if let resultVC = segue.destination as? ResultViewController {
//                resultVC.sendedImage = #imageLiteral(resourceName: "success.png")
//                resultVC.resultLabel.text = ""
//            }
//        }
//    }

    @IBAction func placeOrderPressed(_ sender: UIButton) {
        performSegue(withIdentifier: K.segues.resultSegue, sender: self)
    }
    @IBAction func dismissPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension CheckoutViewController: UITableViewDelegate {
    
}

extension CheckoutViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.checkoutCell, for: indexPath) as! CheckoutTableViewCell
        cell.setup(name: names[indexPath.row], option: options[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(65)
    }
}
