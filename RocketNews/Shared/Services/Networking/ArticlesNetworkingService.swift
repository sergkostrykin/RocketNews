//
//  ArticlesNetworkingService.swift
//  RocketNews
//
//  Created by Sergiy Kostrykin on 21/08/2022.
//

import Foundation
import Alamofire

class ArticlesNetworkingService {
    
    class func articles(completion: (([Article]?, Error?)->())?) {
        let url = Constants.API.baseUrl.appendingPathComponent("v3/articles")
        let request = NetworkingService.sharedSession.request(url, method: .get).validate()
        request.responseData { response in
            switch response.result {
            case .success(let data):
                let result: [Article]? = data.decoded()
                guard let result = result else {
                    completion?(nil, NSError.standard(message: "Data error.", code: -1))
                    return
                }
                completion?(result, nil)
            case .failure(let error):
                completion?(nil, error)
            }
        }
    }
        
    class func article(id: Int, completion: ((Article?, Error?)->())?) {
        let url = Constants.API.baseUrl.appendingPathComponent("v3/articles/\(id)")
        let request = NetworkingService.sharedSession.request(url, method: .get).validate()
        request.responseData { response in
            switch response.result {
            case .success(let data):
                let result: Article? = data.decoded()
                guard let result = result else {
                    completion?(nil, NSError.standard(message: "Data error.", code: -1))
                    return
                }
                completion?(result, nil)
            case .failure(let error):
                completion?(nil, error)
            }
        }
    }

    class func articleLaunch(id: String, completion: (([Article]?, Error?)->())?) {
        let url = Constants.API.baseUrl.appendingPathComponent("v3/articles/launch/\(id)")
        let request = NetworkingService.sharedSession.request(url, method: .get).validate()
        request.responseData { response in
            switch response.result {
            case .success(let data):
                let result: [Article]? = data.decoded()
                guard let result = result else {
                    completion?(nil, NSError.standard(message: "Data error.", code: -1))
                    return
                }
                completion?(result, nil)
            case .failure(let error):
                completion?(nil, error)
            }
        }
    }

    class func articleEvent(id: Int, completion: (([Article]?, Error?)->())?) {
        let url = Constants.API.baseUrl.appendingPathComponent("v3/articles/event/\(id)")
        let request = NetworkingService.sharedSession.request(url, method: .get).validate()
        request.responseData { response in
            switch response.result {
            case .success(let data):
                let result: [Article]? = data.decoded()
                guard let result = result else {
                    completion?(nil, NSError.standard(message: "Data error.", code: -1))
                    return
                }
                completion?(result, nil)
            case .failure(let error):
                completion?(nil, error)
            }
        }
    }
}
