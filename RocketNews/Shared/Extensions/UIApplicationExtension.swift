//
//  UIApplicationExtension.swift
//  RocketNews
//
//  Created by Sergiy Kostrykin on 21/08/2022.
//

import UIKit

extension UIApplication {
    
    static func openUrl(_ string: String?) {
        guard let url = string?.url, UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url)
    }
}
