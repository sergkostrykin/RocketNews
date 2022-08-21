//
//  StringExtension.swift
//  HomeService
//
//  Created by Sergiy Kostrykin on 24.05.2022.
//

import Foundation

extension String {

    var url: URL? {
        URL(string: self)
    }
    
    var createdAtDateString: String? {
        Date.standardDateFormatter.date(from: self)?.createdAtDateString
    }

}
