//
//  TaskDetailProtocols.swift
//  ToDoApplication
//
//  Created by Sezer Özaltun on 27.03.2022.
//

import Foundation

protocol ViewToPresenterTaskDetail{
    var taskDetailInteractor:PresenterToInteractorTaskDetail? {get set}
    func update(taskId:Int,taskTitle:String,taskNote:String)
}
protocol PresenterToInteractorTaskDetail{
    func taskUpdate(taskId:Int,taskTitle:String,taskNote:String)
}
protocol PresenterToRouterTaskDetail{
    static func createModule(ref:TaskDetailVC)
}

