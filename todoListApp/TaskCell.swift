/*:
 
 - File Name:
 TaskCell.swift
 
 - Author:
 Lawrence Martin
 
 - App Name:
 TaskFire
 
 - Student ID:
 300782358
 
 - File Description:
Custom cell for tasks
 
 */


import UIKit

class TaskCell: UITableViewCell {

    // Custom Task cell consists of Name, Note labels and Completed status switch
    @IBOutlet weak var name_label: UILabel!
    @IBOutlet weak var notes_label: UILabel!
    @IBOutlet weak var completedSwitch_outlet: UISwitch!
    
    
    /// Switch action
    @IBAction func completedSwitch(_ sender: UISwitch) {
        
        greyOutLabel()
        
    }
    
    /// "Grey out" label if task is marked complete
    func greyOutLabel(){
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: name_label.text!)
        
        if (completedSwitch_outlet.isOn) {
            name_label.textColor = UIColor.black
            name_label.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
            
            attributeString.removeAttribute(NSStrikethroughStyleAttributeName, range: NSMakeRange(0, attributeString.length))
            
            
            name_label.attributedText = attributeString
            
        }
        else{
            name_label.textColor = UIColor.lightGray
            
            attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, attributeString.length))
            
            
            name_label.attributedText = attributeString
        }
        
    }

    ///  Configure or instantiate custom cell
    func configureCell(name: String, completed: Bool, note: String){
    
        name_label.text = name
        completedSwitch_outlet.isOn = !completed
        notes_label.text = note
        
        //Init with label greyed out if value is completed
        greyOutLabel()
    
    }
  

}
