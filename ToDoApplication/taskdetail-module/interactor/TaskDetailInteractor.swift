//
//  TaskDetailInteractor.swift
//  ToDoApplication
//
//  Created by Sezer Özaltun on 27.03.2022.
//

import Foundation

class TaskDetailInteractor : PresenterToInteractorTaskDetail {
    
    let db:FMDatabase?
    init(){
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: targetPath).appendingPathComponent("task.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }
    
    func taskUpdate(taskId: Int, taskTitle: String, taskNote: String) {
        db?.open()
        
        do{
            try db?.executeUpdate("UPDATE task SET task_title = ? , task_note = ? WHERE task_id = ? ",
                                  values: [taskTitle,taskNote,taskId])
        }catch{}
        
        db?.close()
        print("Updated \(taskId) - \(taskTitle) - \(taskNote)")
    }
    
    
}
