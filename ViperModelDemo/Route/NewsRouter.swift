//
//  NewsRouter.swift
//  ViperModelDemo
//
//  Created by Vaishak Iyer on 21/06/19.
//  Copyright © 2019 Vaishak Iyer. All rights reserved.
//

import Foundation
import UIKit



class NewsRouter: PresenterToRouterProtocol{
    
    
    class func createModule() -> UIViewController {
        
        let initialView = mainstoryboard.instantiateViewController(withIdentifier: "NewsViewController") as? NewsViewController
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = LiveNewsPresenter()
        var interactor: PresenterToInteractorProtocol = LiveNewsInteractor()
        let router: PresenterToRouterProtocol = NewsRouter()
        
        initialView?.presenter = presenter
        presenter.view = initialView!
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return initialView!
    }
    
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: nil)
    }
}
