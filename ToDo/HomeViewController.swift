//
//  ViewController.swift
//  ToDo
//
//  Created by Peter Cerhan on 6/7/17.
//  Copyright © 2017 Peter Cerhan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "//TODO:"
    }
    
    //MARK: - User Actions
    
    @IBAction func addTodo() {
        let vc = storyboard!.instantiateViewController(withIdentifier: "TodoDetailViewController")
        present(vc, animated: true, completion: nil)
    }
    
    
    
    //TODO: Build App

}

