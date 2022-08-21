//
//  CodableExtension.swift
//  HomeService
//
//  Created by Sergiy Kostrykin on 24.05.2022.
//

import Foundation

extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }

    func encoded() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}

extension Data {
    func decoded<T: Decodable>() -> T? {
        return try? JSONDecoder().decode(T.self, from: self)
    }
}

extension Dictionary {
    var json: Data? {
        try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
    }
}
