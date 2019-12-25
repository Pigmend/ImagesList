//
//  ImageList.swift
//  imagesListApp
//
//  Created by Pigmend on 12/25/19.
//  Copyright © 2019 Pigmend. All rights reserved.
//

import Foundation
import UIKit

class ImageList {
    private var imageArray: [UIImage] = []
    
    var images: [UIImage] {
        return imageArray
    }
    
    func append(url: String, completion: DownloadCompletion) {
        downloadImage(from: url) { (image) in
            guard let imageData = image else { return }
            self.imageArray.append(imageData)
            completion?(imageData)
        }
    }
 
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    private func downloadImage(from urlStr: String, completion: DownloadCompletion) {
        guard let url = URL(string: urlStr) else { return }
        getData(from: url) { data, _, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                let image = UIImage(data: data)
                completion?(image)
            }
        }
    }
}

