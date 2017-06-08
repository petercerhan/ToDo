//
//  TodoDetailViewController.swift
//  ToDo
//
//  Created by Peter Cerhan on 6/7/17.
//  Copyright © 2017 Peter Cerhan. All rights reserved.
//

import UIKit

class TodoDetailViewController: UIViewController {

    @IBOutlet var todoTextField: UITextField!
    @IBOutlet var notesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancel() {
        dismiss(animated: true)
    }

}

//MARK:- UITextFieldDelegate

extension TodoDetailViewController: UITextFieldDelegate {
    
    func dismissKeyboard() {
        todoTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        dismissKeyboard()
        
        if textField.text == "" {
            
        } else {
            
        }
        
        return true
    }
    
}
