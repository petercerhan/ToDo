//
//  TodoDetailViewController.swift
//  ToDo
//
//  Created by Peter Cerhan on 6/7/17.
//  Copyright © 2017 Peter Cerhan. All rights reserved.
//

import UIKit

class TodoDetailViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var noteTextView: UITextView!
    
    var todo: Todo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = todo?.title
        noteTextView.text = todo?.note ?? ""
    }

    
    //MARK: - User Actions
    
    @IBAction func back() {
        dismiss(animated: true)
    }
    
}
