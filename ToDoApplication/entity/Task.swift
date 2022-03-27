//
//  Task.swift
//  ToDoApplication
//
//  Created by Sezer Özaltun on 27.03.2022.
//

import Foundation

class Task {
    var taskId : Int?
    var taskTitle: String?
    var taskNote: String?
    
    init(){
        
    }
    init(taskId:Int,taskTitle:String,taskNote:String){
        self.taskId = taskId
        self.taskTitle = taskTitle
        self.taskNote = taskNote
    }
}
