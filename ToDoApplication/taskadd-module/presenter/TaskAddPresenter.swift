//
//  TaskAddPresenter.swift
//  ToDoApplication
//
//  Created by Sezer Özaltun on 27.03.2022.
//

import Foundation

class TaskAddPresenter : ViewToPresenterTaskAdd {
    var taskAddInteractor: PresenterToInteractorTaskAdd?
    
    func add(taskTitle: String, taskNote: String) {
        taskAddInteractor?.taskAdd(taskTitle: taskTitle, taskNote: taskNote)
    }
    
    
}
