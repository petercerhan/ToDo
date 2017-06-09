//
//  TodoTableViewCell.swift
//  ToDo
//
//  Created by Peter Cerhan on 6/7/17.
//  Copyright © 2017 Peter Cerhan. All rights reserved.
//

import UIKit

typealias CompleteHandler = () -> ()

class TodoTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var checkButton: UIButton!
    
    var completeHandler: CompleteHandler?
    
    @IBAction func checkButtonPressed() {
        if let completeHandler = completeHandler {
            completeHandler()
        }
    }
}


