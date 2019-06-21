//
//  LiveNewsInteractor.swift
//  ViperModelDemo
//
//  Created by Vaishak Iyer on 19/06/19.
//  Copyright © 2019 Vaishak Iyer. All rights reserved.
//

import Foundation
import UIKit


class LiveNewsInteractor: PresenterToInteractorProtocol {
    
    
    var presenter: InteractorToPresenterProtocol?
    
    func fetchLiveNews() {
        
        let headers = [
            "User-Agent": "PostmanRuntime/7.13.0",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "195338f3-5c46-42ba-9a79-2ffff7ded441,6e36fc38-033d-4c15-a5f9-76fb8d34a3d6",
            "Host": "newsapi.org",
            "accept-encoding": "gzip, deflate",
            "Connection": "keep-alive",
            "cache-control": "no-cache"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://newsapi.org/v1/articles?source=techcrunch&apiKey=17cf1b333e964cea91e89e1e824bd366")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                self.presenter?.liveNewsFetchedFailed()
            } else {
                //let httpResponse = response as? HTTPURLResponse
                
                if let data = data{
                    guard let newsObject = try? JSONDecoder().decode(NewsModel.self, from: data) else {return}
                    self.presenter?.liveNewsFetched(news: newsObject)
                    
                    
                }
            }
        })
        
        dataTask.resume()
    }
    
}
