//
//  HomePageRouter.swift
//  ToDoApplication
//
//  Created by Sezer Özaltun on 27.03.2022.
//

import Foundation

class HomePageRouter : PresenterToRouterHomePage {
    static func createModue(ref: ViewController) {
        let presenter = HomePagePresenter()
        
        //View
        ref.homePagePresenter = presenter
        
        //Presenter
        ref.homePagePresenter?.homePageInteractor = HomePageInteractor()
        ref.homePagePresenter?.homePageView = ref
        
        //Interactor
        ref.homePagePresenter?.homePageInteractor?.homePagePresenter = presenter
        
    }
}
