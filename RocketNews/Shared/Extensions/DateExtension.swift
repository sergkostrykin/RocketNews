//
//  DateExtension.swift
//  RocketNews
//
//  Created by Sergiy Kostrykin on 21/08/2022.
//

import Foundation

extension Date {

    static let standardDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: Calendar.Identifier.iso8601)
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return dateFormatter
    }()
    
    static let createdAtDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy "
        return formatter
    }()
    
    var createdAtDateString: String {
        Date.createdAtDateFormatter.string(from: self)
    }

}
