//
//  HomePageInteractor.swift
//  ToDoApplication
//
//  Created by Sezer Özaltun on 27.03.2022.
//

import Foundation

class HomePageInteractor : PresenterToInteractorHomePage {
    var homePagePresenter: InteractorToPresenterHomePage?
    
    let db:FMDatabase?
    init(){
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: targetPath).appendingPathComponent("task.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }
    
    func getAllTask() {
        var taskList = [Task]()
        
        db?.open()
        
        do{
            let q = try db!.executeQuery("SELECT * FROM task", values: nil)
            
            while q.next(){
                let taskId = Int(q.string(forColumn: "task_id"))!
                let taskTitle = q.string(forColumn: "task_title")!
                let taskNote = q.string(forColumn: "task_note")!
                
                let task = Task(taskId: taskId, taskTitle: taskTitle, taskNote: taskNote)
                taskList.append(task)
            }
            homePagePresenter?.sendDataToPresenter(taskList: taskList)
        }catch{
            
        }
        
        db?.close()
        
       
    }
    
    func searchTask(word: String) {
        var taskList = [Task]()
        db?.open()
        do{
            let q = try db!.executeQuery("SELECT * FROM task WHERE task_title like '%\(word)%'", values: nil)
            
            while q.next(){
                let taskId = Int(q.string(forColumn: "task_id"))!
                let taskTitle = q.string(forColumn: "task_title")!
                let taskNote = q.string(forColumn: "task_note")!
                
                let task = Task(taskId: taskId, taskTitle: taskTitle, taskNote: taskNote)
                taskList.append(task)
            }
            homePagePresenter?.sendDataToPresenter(taskList: taskList)
        }catch{
            
        }
        db?.close()
    }
    
    func deleteTask(taskId: Int) {
        db?.open()
        do{
            try db?.executeUpdate("DELETE FROM task  WHERE task_id = ? ",
                                  values: [taskId])
            getAllTask()
        }catch{}
        db?.close()
        print("\(taskId) deleted")
    }
    
    
}
