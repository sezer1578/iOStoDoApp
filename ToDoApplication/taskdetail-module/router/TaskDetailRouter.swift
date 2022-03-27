//
//  TaskDetailRouter.swift
//  ToDoApplication
//
//  Created by Sezer Özaltun on 27.03.2022.
//

import Foundation

class TaskDetailRouter:PresenterToRouterTaskDetail {
    static func createModule(ref: TaskDetailVC) {
        ref.taskDetailPresenter = TaskDetailPresenter()
        ref.taskDetailPresenter?.taskDetailInteractor = TaskDetailInteractor()
    }
}
