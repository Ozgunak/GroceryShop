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
    @IBOutlet weak var itemQuantity: UILabel!
    
    var fruit: FruitModel?
    private var quantity = 0
    var wrappedQantity: Int {
        get {
            return quantity
        }
        set {
            quantity = max(newValue, 0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        detailImageView.image = fruit?.image
        bottomImageVıew.layer.cornerRadius = 40
        bottomImageVıew.backgroundColor = .white
        itemName.text = fruit?.title
        itemPrice.text = "10 TL"
    }
    

    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func minusTapped(_ sender: UIButton) {
        if wrappedQantity > 0 {
            wrappedQantity -= 1
        } else {
            wrappedQantity = 0
        }
        updateUI()
    }
    @IBAction func plusTapped(_ sender: UIButton) {
        wrappedQantity += 1
        updateUI()
    }
    
    @IBAction func addTapped(_ sender: UIButton) {
        // add to cart
    }
    
    func updateUI() {
        itemQuantity.text = String(wrappedQantity)
    }
}

