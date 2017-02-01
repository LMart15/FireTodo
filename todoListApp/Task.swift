//
//  Task.swift
//  todoListApp
//
//  Created by Lawrence Martin on 2017-01-31.
//  Copyright © 2017 mapd.centennial. All rights reserved.
//

import Foundation

class Task: NSObject {

    let name: String
    let completed:Bool
    let notes: String

    init(name:String, completed: Bool, notes: String) {
        self.name = name
        self.completed = completed
        self.notes = notes
        
    }
    

}
