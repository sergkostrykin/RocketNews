//
//  AppRouter.swift
//  HomeService
//
//  Created by Sergiy Kostrykin on 23.05.2022.
//

import UIKit

class AppRouter: NSObject {
    
    // MARK: - Properties
    static let shared = AppRouter()
    private var window: UIWindow!
    
    // MARK: - init
    override init () {
        self.window = UIWindow()
        self.window.makeKeyAndVisible()
        super.init()
        showHomeViewController()
    }
    
    func showHomeViewController() {
        let vc = UIViewController()
        vc.view.backgroundColor = .red
        window.rootViewController = MainViewController()
    }
}
