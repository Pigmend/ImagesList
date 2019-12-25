//
//  Helpers.swift
//  imagesListApp
//
//  Created by Pigmend on 12/25/19.
//  Copyright © 2019 Pigmend. All rights reserved.
//

import Foundation
import UIKit

typealias DownloadCompletion = ((UIImage?)->Void)?

protocol IAlertHelper: class {
    func showError(message: String)
}

extension IAlertHelper where Self: UIViewController {
    func showError(message: String) {
        let title = "Error"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true)
    }
}
