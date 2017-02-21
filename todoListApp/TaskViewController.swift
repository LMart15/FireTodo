//
//  ViewController.swift
//  todoListApp
//
//  Created by Lawrence Martin on 2017-01-31.
//  Copyright © 2017 mapd.centennial. All rights reserved.
//

import UIKit
import FirebaseDatabase

class TaskViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var dbRef:FIRDatabaseReference!
    var allTasks = [Task]()
    
    let task1 = Task(name: "Dry Cleaning", completed: false, note: "Pick up before friday")
    let task2 = Task(name: "Grocery Shopping", completed: false, note: "There's nothing to eat in the house")
    let task3 = Task(name: "Lab 3", completed: true, note: "iOS lab due before end of class")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dbRef = FIRDatabase.database().reference().child("tasks-data")
        self.startObservingDB()
        
        //        Added some patients manually
        //        //create dbref with patientID as key
        //        let taskRef = self.dbRef.childByAutoId()
        //
        //        //set patient data in firebase
        //        taskRef.setValue(task3.toDictionary())
    }
    
    
    //observe DB function to see changes in location value
    func startObservingDB() {
        
        dbRef.observe(.value, with: { (snapshot:FIRDataSnapshot) in
            var aTasks = [Task]()
            
            for task in snapshot.children{
                let taskObject = Task(snapshot: task as! FIRDataSnapshot)
                aTasks.append(taskObject)
            }
            
            //set data
            self.allTasks = aTasks
            self.tableView.reloadData()
            
        }) {(error:Error) in
            print(error)
        }
        
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell =
            tableView.dequeueReusableCell(withIdentifier: "taskCellIdentifier", for: indexPath) as? TaskCell{
        
            cell.configureCell(name: allTasks[indexPath.row].name!,
                               completed: allTasks[indexPath.row].completed!,
                               note: allTasks[indexPath.row].note!)
            
            return cell
        }
        else {
            return TaskCell()
        }
        
        
    }


}

