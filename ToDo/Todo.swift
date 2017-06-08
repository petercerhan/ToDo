//
//  Todo.swift
//  ToDo
//
//  Created by Peter Cerhan on 6/7/17.
//  Copyright © 2017 Peter Cerhan. All rights reserved.
//

import Foundation
import CoreData

extension Todo {
    
    convenience init(title: String, note: String, context: NSManagedObjectContext) {
        if let entity = NSEntityDescription.entity(forEntityName: "Todo", in: context) {
            self.init(entity: entity, insertInto: context)
            self.title = title
            self.note = note
            self.dateCreated = NSDate()
        } else {
            fatalError("Could not build Todo object")
        }
    }
    
}

