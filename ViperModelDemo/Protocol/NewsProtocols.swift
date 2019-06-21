//
//  NewsProtocols.swift
//  ViperModelDemo
//
//  Created by Vaishak Iyer on 19/06/19.
//  Copyright © 2019 Vaishak Iyer. All rights reserved.
//

import Foundation
import UIKit



protocol ViewToPresenterProtocol: class {
    var view : PresenterToViewProtocol? {get set}
    var router : PresenterToRouterProtocol? {get set}
    var interactor : PresenterToInteractorProtocol? {get set}
    func updateView()
}

protocol InteractorToPresenterProtocol {
    func liveNewsFetched(news: NewsModel)
    func liveNewsFetchedFailed()
}

protocol PresenterToViewProtocol: class{
    
    func showLiveNews(news: NewsModel)
    func showError()
}

protocol PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol? {get set}
    func fetchLiveNews()
}


protocol PresenterToRouterProtocol: class {
    static func createModule() -> UIViewController;
}

