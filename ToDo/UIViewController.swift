//
//  UIViewController.swift
//  ToDo
//
//  Created by Peter Cerhan on 6/8/17.
//  Copyright © 2017 Peter Cerhan. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func alert(title: String?, message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alert.addAction(dismissAction)
        present(alert, animated: true, completion: nil)
    }
    
}
