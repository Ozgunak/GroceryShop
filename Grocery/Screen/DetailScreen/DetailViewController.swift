//
//  DetailViewController.swift
//  Grocery
//
//  Created by ozgun on 17.02.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var bottomImageVıew: UIImageView!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var itemQuantity: UILabel!
    
    var item: ItemModel?
    var quantity = 1
    private var isAdded = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        detailImageView.image = item?.image
        bottomImageVıew.layer.cornerRadius = 40
        itemName.text = item?.title
        itemPrice.text = String(item!.price)
    }
    

    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func minusTapped(_ sender: UIButton) {
        if quantity > 0 {
            quantity -= 1
        } else {
            quantity = 0
        }
        updateUI()
        //TODO: delete eklenecek
        
    }
    @IBAction func plusTapped(_ sender: UIButton) {
        if isAdded == true {
            CartFunctions.addItem(item: CartModel(item: item!, quantity: quantity + 1))
        }
        quantity += 1
        updateUI()
        addButton.setTitle("Update Cart", for: .normal)
        
    }
    
    @IBAction func addTapped(_ sender: UIButton) {
        if let itemModel = item {
            CartFunctions.addItem(item: CartModel(item: itemModel, quantity: quantity))
            isAdded = true
        }
        addButton.setTitle("\(quantity) On Cart", for: .normal)
    }
    
    func updateUI() {
        itemQuantity.text = String(quantity)
    }
}

