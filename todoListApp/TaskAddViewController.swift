//
//  TaskAddViewController.swift
//  todoListApp
//
//  Created by Lawrence Martin on 2017-02-20.
//  Copyright © 2017 mapd.centennial. All rights reserved.
//

import UIKit
import FirebaseDatabase

class TaskAddViewController: UIViewController {

    @IBOutlet weak var name_tv: UITextView!
    @IBOutlet weak var notes_tv: UITextView!
    var dbRef:FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dbRef = FIRDatabase.database().reference().child("tasks-data")
    }
    
    @IBAction func saveTask(_ sender: Any) {
        
        if name_tv.text!.isEmpty || notes_tv.text!.isEmpty {
            
            showAlert()
        
        }else{
            
        let task1 = Task(name: name_tv.text, completed: false, note: notes_tv.text)
        
                  let taskRef = self.dbRef.childByAutoId()
                  taskRef.setValue(task1.toDictionary())
        
        //navigate back to task list
        navigationController?.popViewController(animated: true)
          
        
        }
        
    }
    
    func showAlert(){
 
        let alert = UIAlertController(title: "Task", message: "Task must have Name and Note", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
