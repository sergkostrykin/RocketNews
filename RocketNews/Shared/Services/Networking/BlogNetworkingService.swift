//
//  BlogNetworkingService.swift
//  RocketNews
//
//  Created by Sergiy Kostrykin on 21/08/2022.
//

import Foundation
import Alamofire

class BlogNetworkingService {
    
    class func blogs(completion: (([Blog]?, Error?)->())?) {
        let url = Constants.API.baseUrl.appendingPathComponent("v3/blogs")
        let request = NetworkingService.sharedSession.request(url, method: .get).validate()
        request.responseData { response in
            switch response.result {
            case .success(let data):
                let result: [Blog]? = data.decoded()
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
    
    class func blog(id: Int, completion: ((Blog?, Error?)->())?) {
        let url = Constants.API.baseUrl.appendingPathComponent("v3/blogs/\(id)")
        let request = NetworkingService.sharedSession.request(url, method: .get).validate()
        request.responseData { response in
            switch response.result {
            case .success(let data):
                let result: Blog? = data.decoded()
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
