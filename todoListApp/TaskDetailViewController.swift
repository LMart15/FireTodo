//
//  TaskDetailViewController.swift
//  todoListApp
//
//  Created by Lawrence Martin on 2017-02-20.
//  Copyright © 2017 mapd.centennial. All rights reserved.
//

import UIKit
import FirebaseDatabase

class TaskDetailViewController: UIViewController {
    
    var currentTask:Task!
    var currentIndex: Int!
    var dbRef:FIRDatabaseReference!
    
    @IBOutlet weak var name_tv: UITextView!
    @IBOutlet weak var notes_tv: UITextView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        dbRef = FIRDatabase.database().reference().child("tasks-data")
        
        name_tv.text = currentTask.name
        notes_tv.text = currentTask.note
        
    }
    @IBAction func updateTask(_ sender: UIBarButtonItem) {
        
        dbRef.child(currentTask.key).updateChildValues(["name" : name_tv.text, "note": notes_tv.text])
        
        //navigate back to task list
        navigationController?.popViewController(animated: true)
        
    }
    @IBAction func deleteTask(_ sender: UIBarButtonItem) {
        
        dbRef.child(currentTask.key).removeValue()
        
        //navigate back to task list
        navigationController?.popViewController(animated: true)
        
    }

}
