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
        
        FruitFunctions.readItems { [weak self] in
            self?.topCollectionView.reloadData()
            self?.midCollectionView.reloadData()
            self?.botCollectionView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.segues.detailScreenSeque {
            if let DetailVC = segue.destination as? DetailViewController {
                if let indexPath = self.botCollectionView.indexPathsForSelectedItems?.first {
                    DetailVC.fruit = FruitFunctions.items[indexPath.row]
                }
            }
        }
    }
    
}

//MARK: - Delegate

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: K.segues.detailScreenSeque, sender: self)
        
//        let story = UIStoryboard(name: String(describing: DetailViewController.self), bundle: nil)
//        let vc = story.instantiateInitialViewController()!
//        self.present(vc, animated: true)
    }
}

//MARK: - Data Source

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FruitFunctions.items.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == topCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.topCell, for: indexPath) as! TopCollectionViewCell
            cell.topLabel.text = FruitFunctions.items[indexPath.row].title
            cell.topImage.image = FruitFunctions.items[indexPath.row].image
            return cell
        } else if collectionView == botCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.botCell, for: indexPath) as! BottomCollectionViewCell
            cell.botImageView.image = FruitFunctions.items[indexPath.row].image
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.midCell, for: indexPath) as! MidCollectionViewCell
            cell.midLabel.text = FruitFunctions.items[indexPath.row].title
            cell.midImageView.image = FruitFunctions.items[indexPath.row].image
            return cell
        }
    }
    
    
}
//MARK: - Flow Layout

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == topCollectionView {
            return CGSize(width: 250, height: 128)
        } else if collectionView == botCollectionView {
            return CGSize(width: 250, height: 250)
        } else {
            return CGSize(width: 80, height: 100)
        }
    }
    
}
