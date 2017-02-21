//
//  TaskDetailViewController.swift
//  todoListApp
//
//  Created by Lawrence Martin on 2017-02-20.
//  Copyright © 2017 mapd.centennial. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    var currentTask:Task!
    var currentIndex: Int!
    
    @IBOutlet weak var taskName_lbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        taskName_lbl.text = currentTask.name!
    }

}
