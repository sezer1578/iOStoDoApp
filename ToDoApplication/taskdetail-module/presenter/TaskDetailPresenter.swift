//
//  TaskDetailPresenter.swift
//  ToDoApplication
//
//  Created by Sezer Özaltun on 27.03.2022.
//

import Foundation

class TaskDetailPresenter : ViewToPresenterTaskDetail {
    var taskDetailInteractor: PresenterToInteractorTaskDetail?
    
    func update(taskId: Int, taskTitle: String, taskNote: String) {
        taskDetailInteractor?.taskUpdate(taskId: taskId, taskTitle: taskTitle, taskNote: taskNote)
    }
    
    
}
