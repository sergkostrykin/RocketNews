//
//  NSErrorExtension.swift
//  HomeService
//
//  Created by Sergiy Kostrykin on 24.05.2022.
//

import Foundation

extension NSError {
    class func standard(message: String?, code: Int = 0) -> NSError {
        return NSError(domain: "self", code: code, userInfo: [NSLocalizedDescriptionKey: message ?? ""])
    }
}
