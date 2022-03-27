//
//  TaskAddInteractor.swift
//  ToDoApplication
//
//  Created by Sezer Özaltun on 27.03.2022.
//

import Foundation

class TaskAddInteractor : PresenterToInteractorTaskAdd {
    
    let db:FMDatabase?
    init(){
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: targetPath).appendingPathComponent("task.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }
    
    func taskAdd(taskTitle: String, taskNote: String) {
        db?.open()
        
        do{
            try db?.executeUpdate("INSERT INTO task (task_title,task_note) VALUES (?,?)",
                                  values: [taskTitle,taskNote])
        }catch{}
        
        db?.close()
       
    }
}
