//
//  Task.swift
//  todoListApp
//
//  Created by Lawrence Martin on 2017-01-31.
//  Copyright © 2017 mapd.centennial. All rights reserved.
//

import Foundation
import FirebaseDatabase


class Task: NSObject {

    let key:String!
    let itemRef:FIRDatabaseReference?
    var name: String?
    var completed:Bool?
    var note: String?
    
    init(key:String = "", name:String, completed: Bool, note: String) {
        self.itemRef = nil
        self.key = key
        
        self.name = name
        self.completed = completed
        self.note = note
    
    }
    
    init(snapshot:FIRDataSnapshot) {
        
        key = snapshot.key
        itemRef = snapshot.ref
        let snapshotValue = snapshot.value as? NSDictionary
        
        name = snapshotValue?["name"] as? String
        note = snapshotValue?["note"] as? String
        
        var taskCompleted:String = (snapshotValue?["completed"] as? String)!
        
        if (taskCompleted == "true"){
            completed = true
        }else{
            completed = false
        }
    }
    
    
    func toDictionary() -> [String:String] {
        
        
        
        return ["name":name!, "note":note!, "completed":BoolToString(b: completed)]
    }
    
    func BoolToString(b: Bool?)->String { return b?.description ?? "<None>"}

}
