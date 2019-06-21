//
//  LiveNewsPresenter.swift
//  ViperModelDemo
//
//  Created by Vaishak Iyer on 19/06/19.
//  Copyright © 2019 Vaishak Iyer. All rights reserved.
//

import Foundation
import UIKit


class LiveNewsPresenter: ViewToPresenterProtocol{
    
    var view: PresenterToViewProtocol?
    
    var router: PresenterToRouterProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    func updateView() {
        interactor?.fetchLiveNews()
    }
    
}

extension LiveNewsPresenter : InteractorToPresenterProtocol{
    func liveNewsFetched(news: NewsModel) {
        view?.showLiveNews(news: news)
    }
    
    func liveNewsFetchedFailed() {
        view?.showError()
    }
    
}
