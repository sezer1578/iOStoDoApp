//
//  TaskAddProtocols.swift
//  ToDoApplication
//
//  Created by Sezer Özaltun on 27.03.2022.
//

import Foundation

protocol ViewToPresenterTaskAdd{
    var taskAddInteractor:PresenterToInteractorTaskAdd? {get set}
    func add(taskTitle:String,taskNote:String)
}
protocol PresenterToInteractorTaskAdd{
    func taskAdd(taskTitle:String,taskNote:String)
}
protocol PresenterToRouterTaskAdd{
    static func createModule(ref:TaskAddVC)
}
