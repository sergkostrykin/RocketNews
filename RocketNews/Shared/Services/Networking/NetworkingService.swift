//
//  NetworkingService.swift
//  HomeService
//
//  Created by Sergiy Kostrykin on 24.05.2022.
//

import Foundation
import Alamofire

class NetworkingService {
    
    static let sharedSession = Alamofire.Session(configuration: .default)

}
