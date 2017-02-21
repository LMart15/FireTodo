/*:
 
 - File Name:
 TaskAddViewController.swift
 
 - Author:
 Lawrence Martin
 
 - App Name:
 TaskFire
 
 - Student ID:
 300782358
 
 - File Description:
 Controller for Add task view
 
 */


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
    
    ///Save a new task in Firebase if required fields are not empty
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
    
    ///Show alert if required fields are empty on save
    func showAlert(){
        
        let alert = UIAlertController(title: "Task", message: "Task must have Name and Note", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
