//
//  HomePagePresenter.swift
//  ToDoApplication
//
//  Created by Sezer Özaltun on 27.03.2022.
//

import Foundation

class HomePagePresenter : ViewToPresenterHomePage {
    var homePageInteractor: PresenterToInteractorHomePage?
    var homePageView: PresenterToViewHomePage?
    
    func loadAllTask() {
        homePageInteractor?.getAllTask()
    }
    
    func search(word: String) {
        homePageInteractor?.searchTask(word: word)
    }
    
    func delete(taskId: Int) {
        homePageInteractor?.deleteTask(taskId: taskId)
    }
}
extension HomePagePresenter : InteractorToPresenterHomePage {
    func sendDataToPresenter(taskList: Array<Task>) {
        homePageView?.sendDataToView(taskList: taskList)
    }
}
