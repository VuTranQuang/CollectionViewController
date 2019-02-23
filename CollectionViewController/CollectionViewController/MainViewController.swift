//
//  MainViewController.swift
//  CollectionViewController
//
//  Created by Vũ on 2/23/19.
//  Copyright © 2019 Vũ. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bigImage: UIImageView!
    @IBOutlet weak var bigLabel: UILabel!
    
    var images = UIImage()
    var label = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        bigImage.image = images
        bigLabel.text = label
        scrollView.delegate = self
    }

   
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return bigImage
    }

    

}
