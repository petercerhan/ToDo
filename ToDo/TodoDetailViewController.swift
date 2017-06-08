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
    
    //MARK: - User Actions
    
    @IBAction func save() {
        saveTodo()
    }
    
    @IBAction func cancel() {
        dismiss(animated: true)
    }

    func saveTodo() {
        print("Todo: \(todoTextField.text ?? "")")
        print("Note: \(notesTextView.text ?? "")")
        
        let todoText = "\(todoTextField.text ?? "")"
        let noteText = "\(notesTextView.text ?? "")"
        
        let moContext = (UIApplication.shared.delegate as! AppDelegate).coreDataStack.context
        let _ = Todo(title: todoText, note: noteText, context: moContext)
        
        do {
            try moContext.save()
        } catch {
            //Unexpected error - core data operations should succeed
        }
        
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
