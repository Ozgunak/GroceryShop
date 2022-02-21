//
//  CategoryViewController.swift
//  Grocery
//
//  Created by ozgun on 20.02.2022.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var itemsLabel: UILabel!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var itemCollectionView: UICollectionView!
    var selectedCategory = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        categoryCollectionView.register(UINib(nibName: K.CategoryCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: K.categoryCell)
        itemCollectionView.register(UINib(nibName: K.ItemsCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: K.itemCell)
        
        getCategories()
        checkCart()
        itemsLabel.layer.masksToBounds = true
        itemsLabel.cornerRadius = 10
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.segues.categoryToDetail {
            if let detailVC = segue.destination as? DetailViewController {
                if let itemIndexPath = self.itemCollectionView.indexPathsForSelectedItems?.first {
                    detailVC.item = CategoryFunctions.categories[selectedCategory].items[itemIndexPath.row]
                    //TODO: set active item selected
                }
            }
        }
    }

    func getCategories() {
        CategoryFunctions.readCategories { [weak self] in
            self?.categoryCollectionView.reloadData()
        }
        ItemFunctions.readItems { [weak self] in
            self?.itemCollectionView.reloadData()
        }
    }
    
    func checkCart() {
        if CartFunctions.cartItems.isEmpty {
            itemsLabel.isHidden = true
        } else {
            itemsLabel.isHidden = false
            itemsLabel.text =  String(CartFunctions.cartItems.count)
        }
        
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func cartButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: K.segues.categoryToCart, sender: self)
    }
    
}

extension CategoryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case categoryCollectionView:
            selectedCategory = indexPath.item
            categoryCollectionView.reloadData()
            itemCollectionView.reloadData()
        case itemCollectionView:
            performSegue(withIdentifier: K.segues.categoryToDetail, sender: self)
        default:
            selectedCategory = indexPath.item
        }
    }
}
extension CategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return CategoryFunctions.categories.count
        case itemCollectionView:
//            let indexpa = categoryCollectionView.indexPathsForSelectedItems?.first
            return CategoryFunctions.categories[selectedCategory].items.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: K.categoryCell, for: indexPath) as! CategoryCollectionViewCell
            // TODO: custom cell ?
            cell.categoryImage.image = CategoryFunctions.categories[indexPath.row].categoryImage
            cell.categoryLabel.text = CategoryFunctions.categories[indexPath.row].categoryName
            if indexPath.row == selectedCategory {
                print(indexPath.row)
                print(selectedCategory)
                cell.selectedImage.isHidden = false
            } else {
                cell.selectedImage.isHidden = true
            }
            return cell
        case itemCollectionView:
//            let indexpa = categoryCollectionView.indexPathsForSelectedItems?.first
            let cell = itemCollectionView.dequeueReusableCell(withReuseIdentifier: K.itemCell, for: indexPath) as! ItemsCollectionViewCell
            cell.getItem(item: CategoryFunctions.categories[selectedCategory].items[indexPath.item])
            cell.buttonPressed = {
                CartFunctions.addItem(item: CartModel(item: CategoryFunctions.categories[self.selectedCategory].items[indexPath.item], quantity: 1))
//                self.shortAlert(title: "Added Item", message: "Added")
                self.checkCart()
            }
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
    
    
}
extension CategoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case categoryCollectionView:
            return CGSize(width: 80, height: 96)
        case itemCollectionView:
            return CGSize(width: 150, height: 200)
        default:
            return CGSize.zero
        }
    }

}
