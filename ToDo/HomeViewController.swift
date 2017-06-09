//
//  ViewController.swift
//  ToDo
//
//  Created by Peter Cerhan on 6/7/17.
//  Copyright © 2017 Peter Cerhan. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var editButton: UIBarButtonItem!
    
    let stack = (UIApplication.shared.delegate as! AppDelegate).coreDataStack
    var fetchedResultsController : NSFetchedResultsController<Todo>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurUI()
        configureFetchedResultsController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func configureFetchedResultsController() {
        let request = NSFetchRequest<Todo>(entityName: "Todo")
        request.sortDescriptors = [NSSortDescriptor(key: "dateCreated", ascending: false)]
        
        let frc = NSFetchedResultsController(fetchRequest: request, managedObjectContext: stack.context, sectionNameKeyPath: nil, cacheName: nil)
        frc.delegate = self
        
        fetchedResultsController = frc
        
        executeSearch()
        tableView.reloadData()
    }
    
    func executeSearch() {
        if let fc = fetchedResultsController {
            do {
                try fc.performFetch()
            } catch _ as NSError {
                
            }
        }
    }

    
    //MARK: - User Actions
    
    @IBAction func addTodo() {
        let vc = storyboard!.instantiateViewController(withIdentifier: "AddTodoViewController")
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func edit() {
        if tableView.isEditing {
            tableView.setEditing(false, animated: true)
            editButton.title = "Edit"
        } else {
            tableView.setEditing(true, animated: true)
            editButton.title = "Done"
        }
    }
    
}

//MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard!.instantiateViewController(withIdentifier: "TodoDetailViewController") as! TodoDetailViewController
        vc.todo = fetchedResultsController!.object(at: indexPath)
        present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let todo = fetchedResultsController!.object(at: indexPath)
            
            stack.context.delete(todo)
            
            stack.save()
        }
    }
}

//MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let fc = fetchedResultsController {
            return fc.sections![section].numberOfObjects
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todo = fetchedResultsController!.object(at: indexPath) as Todo
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoTableViewCell") as! TodoTableViewCell
        cell.titleLabel.text = todo.title
        cell.selectionStyle = .none
        cell.checkButton.setImage(UIImage(named: todo.complete ? "Checked" : "Unchecked"), for: .normal)
        
        cell.completeHandler = {
            todo.complete = !(todo.complete)
            self.stack.save()
        }
        
        return cell
    }
    
}

//MARK: - NSFetchedResultsControllerDelegate

extension HomeViewController: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        
        let set = IndexSet(integer: sectionIndex)
        
        switch (type) {
        case .insert:
            tableView.insertSections(set, with: .fade)
        case .delete:
            tableView.deleteSections(set, with: .fade)
        default:
            break
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch(type) {
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .fade)
        case .update:
            print("update")
            tableView.reloadRows(at: [indexPath!], with: .none)
        default:
            break
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
}

//MARK: - Configure UI

extension HomeViewController {
    
    func configurUI() {
        title = "//TODO:"
        //Stop table view from filling screen with empty cells
        tableView.tableFooterView = UIView()
    }
    
}
