//
//  TodoDetailViewController.swift
//  ToDo
//
//  Created by Peter Cerhan on 6/7/17.
//  Copyright © 2017 Peter Cerhan. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController {

    @IBOutlet var todoTextField: UITextField!
    @IBOutlet var notesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - User Actions
    
    @IBAction func save() {
        if todoTextField.text == "" {
            alert(title: nil, message: "Please enter a title!", buttonTitle: "Dismiss")
        } else {
            saveTodo()
        }
    }
    
    @IBAction func cancel() {
        dismiss(animated: true)
    }

    func saveTodo() {
        let todoText = "\(todoTextField.text!)"
        let noteText = "\(notesTextView.text ?? "")"
        
        let stack = (UIApplication.shared.delegate as! AppDelegate).coreDataStack
        let _ = Todo(title: todoText, note: noteText, context: stack.context)
        
        stack.save()
        
        dismiss(animated: true)
    }
    
}

//MARK: - UITextFieldDelegate

extension AddTodoViewController: UITextFieldDelegate {
    
    func dismissKeyboard() {
        todoTextField.resignFirstResponder()
        notesTextView.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        
        return true
    }
    
}

//MARK: - Configure UI

extension AddTodoViewController {
    
    func configureUI() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard)))
    }
    
}

