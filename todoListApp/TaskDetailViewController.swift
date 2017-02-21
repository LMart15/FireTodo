/*:
 
 - File Name:
 TaskDetailViewController.swift
 
 - Author:
 Lawrence Martin
 
 - App Name:
 TaskFire
 
 - Student ID:
 300782358
 
 - File Description:
 Controller for task detail view
 
 */


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
    
    ///Update task in Firebase if required fields are not empty, return to task list
    @IBAction func updateTask(_ sender: UIBarButtonItem) {
        
        if name_tv.text!.isEmpty || notes_tv.text!.isEmpty {
            showAlert()
        }
        else{
            
            dbRef.child(currentTask.key).updateChildValues(["name" : name_tv.text, "note": notes_tv.text])
            
            //navigate back to task list
            navigationController?.popViewController(animated: true)
        }
    }
    
    ///Delete task in Firebase and return to task list
    @IBAction func deleteTask(_ sender: UIBarButtonItem) {
        
        dbRef.child(currentTask.key).removeValue()
        
        //navigate back to task list
        navigationController?.popViewController(animated: true)
        
    }
    
    ///Show alert if required fields are empty on save
    func showAlert(){
        
        let alert = UIAlertController(title: "Task", message: "Task must have Name and Note", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
