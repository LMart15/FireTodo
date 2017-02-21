/*:
 
 - File Name:
 Task.swift
 
 - Author:
 Lawrence Martin
 
 - App Name:
 TaskFire
 
 - Student ID:
 300782358
 
 - File Description:
 Task model
 
 */


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
    
    ///Convert all fields to string for easy storage in Firebase
    func toDictionary() -> [String:String] {
        
        return ["name":name!, "note":note!, "completed":BoolToString(b: completed)]
    }
    
    ///Convert a boolean value to string
    func BoolToString(b: Bool?)->String { return b?.description ?? "<None>"}

}
