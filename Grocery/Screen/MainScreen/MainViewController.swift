//
//  MainViewController.swift
//  Grocery
//
//  Created by ozgun on 17.02.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var midCollectionView: UICollectionView!
    @IBOutlet weak var botCollectionView: UICollectionView!
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topCollectionView.register(UINib(nibName: K.TopCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: K.topCell)
        midCollectionView.register(UINib(nibName: K.MidCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: K.midCell)
        botCollectionView.register(UINib(nibName: K.BottomCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: K.botCell)
        
        ItemFunctions.readItems { [weak self] in
            self?.topCollectionView.reloadData()
            self?.botCollectionView.reloadData()
        }
        CategoryFunctions.readCategories { [weak self] in
            self?.midCollectionView.reloadData()

        }
    }
    
    
    @IBAction func categoriesPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: K.segues.categoryScreenSeque, sender: self)
    }
    
    @IBAction func cartButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: K.segues.mainToCartSegue, sender: self)
    }
    
    @IBAction func profilePressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: K.segues.mainToProfileSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.segues.detailScreenSeque {
            if let DetailVC = segue.destination as? DetailViewController {
                if let botIndexPath = self.botCollectionView.indexPathsForSelectedItems?.first {
                    DetailVC.item = ItemFunctions.fruitItems[botIndexPath.row]
                }
                if let topIndexPath = self.topCollectionView.indexPathsForSelectedItems?.first {
                    DetailVC.item = ItemFunctions.fruitItems[topIndexPath.row]
                    //TODO: - route to discounts
                }
            }
        } else if segue.identifier == K.segues.categoryScreenSeque {
            if let categoryVC = segue.destination as? CategoryViewController {
                if let midIndexPath = self.midCollectionView.indexPathsForSelectedItems?.first {
                    categoryVC.selectedCategory = midIndexPath.item
                    //TODO: set active item selected
                }
            }
        }
    }
    
}

//MARK: - Delegate

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case topCollectionView:
            performSegue(withIdentifier: K.segues.detailScreenSeque, sender: self)
        case midCollectionView:
            performSegue(withIdentifier: K.segues.categoryScreenSeque, sender: self)
        case botCollectionView:
            performSegue(withIdentifier: K.segues.detailScreenSeque, sender: self)
        default:
            break
        }
    }
}

//MARK: - Data Source

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case topCollectionView:
            return ItemFunctions.fruitItems.count
        case midCollectionView:
            return CategoryFunctions.categories.count
        case botCollectionView:
            return ItemFunctions.fruitItems.count
        default:
            return 0
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case topCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.topCell, for: indexPath) as! TopCollectionViewCell
            cell.topLabel.text = ""
            return cell
        case midCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.midCell, for: indexPath) as! MidCollectionViewCell
            cell.midLabel.text = CategoryFunctions.categories[indexPath.row].categoryName
            cell.midImageView.image = CategoryFunctions.categories[indexPath.row].categoryImage
            return cell
        case botCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.botCell, for: indexPath) as! BottomCollectionViewCell
            cell.setupBot(item: ItemFunctions.fruitItems[indexPath.row])
//            cell.botImageView.image = ItemFunctions.fruitItems[indexPath.row].image
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.botCell, for: indexPath)
            return cell
        }
    }
}
//MARK: - Flow Layout

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case topCollectionView:
            return CGSize(width: 250, height: 128)
        case midCollectionView:
            return CGSize(width: 80, height: 100)
        case botCollectionView:
            return CGSize(width: 250, height: 300)
        default:
            return CGSize.zero
        }
//        if collectionView == topCollectionView {
//        } else if collectionView == botCollectionView {
//        } else {
//        }
    }
    
}
