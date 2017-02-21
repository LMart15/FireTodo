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
    
    @IBOutlet weak var name_tv: UITextView!
    @IBOutlet weak var notes_tv: UITextView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        name_tv.text = currentTask.name
        notes_tv.text = currentTask.note
        
    }

}
