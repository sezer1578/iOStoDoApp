//
//  HomePageProtocols.swift
//  ToDoApplication
//
//  Created by Sezer Özaltun on 27.03.2022.
//

import Foundation

protocol ViewToPresenterHomePage {
    var homePageInteractor : PresenterToInteractorHomePage? {get set}
    var homePageView : PresenterToViewHomePage? {get set}
    func loadAllTask()
    func search(word:String)
    func delete(taskId:Int)
}

protocol PresenterToInteractorHomePage {
    var homePagePresenter : InteractorToPresenterHomePage? {get set}
    func getAllTask()
    func searchTask(word:String)
    func deleteTask(taskId:Int)
}

protocol InteractorToPresenterHomePage {
    func sendDataToPresenter(taskList:Array<Task>)
}

protocol PresenterToViewHomePage {
    func sendDataToView(taskList:Array<Task>)
}

protocol PresenterToRouterHomePage {
    static func createModue(ref:ViewController)
}
