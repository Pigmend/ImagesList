//
//  ViewController.swift
//  imagesListApp
//
//  Created by Pigmend on 12/25/19.
//  Copyright © 2019 Pigmend. All rights reserved.
//

import UIKit

class ViewController: UIViewController, IAlertHelper {
    
    private var imageList = ImageList()

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func pushUrlButtonPressed(_ sender: Any) {
        let url = "https://i.imgur.com/h08MX0D.jpg"
        imageList.append(url: url) { (image) in
            self.imageView.image = image
        }
    }
    
}
