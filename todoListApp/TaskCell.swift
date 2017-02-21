//
//  TaskCell.swift
//  todoListApp
//
//  Created by Lawrence Martin on 2017-01-31.
//  Copyright © 2017 mapd.centennial. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    
    @IBOutlet weak var name_label: UILabel!
    @IBOutlet weak var notes_label: UILabel!
    @IBOutlet weak var completedSwitch_outlet: UISwitch!
    
    
 
    @IBAction func completedSwitch(_ sender: UISwitch) {
        
        greyOutLabel()
        
    }
    
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
 
    
    @IBAction func edit_button(_ sender: UIButton) {
        
        
    }
    
    func configureCell(name: String, completed: Bool, note: String){
    
        name_label.text = name
        completedSwitch_outlet.isOn = !completed
        notes_label.text = note
        
        //Init with label greyed out if value is completed
        greyOutLabel()
    
    }
  

}
