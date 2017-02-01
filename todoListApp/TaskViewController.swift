//
//  ViewController.swift
//  todoListApp
//
//  Created by Lawrence Martin on 2017-01-31.
//  Copyright © 2017 mapd.centennial. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController, UITableViewDataSource {
    
    
    var tasks = [Task]()
    
    let task1 = Task(name: "Dry Cleaning", completed: false, notes: "Pick up before friday")
    let task2 = Task(name: "Grocery Shopping", completed: false, notes: "There's nothing to eat in the house")
    let task3 = Task(name: "Lab 3", completed: true, notes: "iOS lab due before end of class")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tasks.append(task1)
        tasks.append(task2)
        tasks.append(task3)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell =
            tableView.dequeueReusableCell(withIdentifier: "taskCellIdentifier", for: indexPath) as? TaskCell{
        
            cell.configureCell(name: tasks[indexPath.row].name,
                               completed: tasks[indexPath.row].completed,
                               notes: tasks[indexPath.row].notes)
            
            return cell
        }
        else {
        
            return TaskCell()
        }
        
        
    }


}

