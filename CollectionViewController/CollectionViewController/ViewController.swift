//
//  ViewController.swift
//  CollectionViewController
//
//  Created by Vũ on 2/23/19.
//  Copyright © 2019 Vũ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    let name = ["Van Anh", "Uni", "Ha Vi", "Bikini", "Sweet", "Cosser"]
    let image: [UIImage] = [
    UIImage(named: "Van Anh")!,
    UIImage(named: "Uni")!,
    UIImage(named: "Ha Vi")!,
    UIImage(named: "Bikini")!,
    UIImage(named: "Sweet")!,
    UIImage(named: "Cosser")!
    
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        var layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.collectionView.frame.width - 20)/3, height: self.collectionView.frame.height/3)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return name.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.myLabel.text = name[indexPath.row]
        cell.myImage.image = image[indexPath.row]
        cell.layer.borderColor = UIColor.darkGray.cgColor
        cell.layer.borderWidth = 0.5
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell  = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.gray.cgColor
        cell?.layer.borderWidth = 2
        // PassData to View Controller
        let mainController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        mainController.images = image[indexPath.row]
        mainController.label = name[indexPath.row]
        self.navigationController?.pushViewController(mainController, animated: true)
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.darkGray.cgColor
        cell?.layer.borderWidth = 0.5
    }

}

