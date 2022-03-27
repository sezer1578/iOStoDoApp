//
//  TaskAddRouter.swift
//  ToDoApplication
//
//  Created by Sezer Özaltun on 27.03.2022.
//

import Foundation

class TaskAddRouter : PresenterToRouterTaskAdd {
    static func createModule(ref: TaskAddVC) {
        ref.taskAddPresenter = TaskAddPresenter()
        ref.taskAddPresenter?.taskAddInteractor = TaskAddInteractor()
        
    }
    
    
}
