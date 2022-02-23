//
//  ResultViewController.swift
//  Grocery
//
//  Created by ozgun on 23.02.2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        resultView.cornerRadius = 10
    }
    

    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)    }
    
}
