//
//  UIImageExtension.swift
//  HomeService
//
//  Created by Sergiy Kostrykin on 24.05.2022.
//

import UIKit

extension UIImage {
    
    class var placeholder: UIImage {
        R.image.placeholder()!
    }
    
    class var articles: UIImage {
        UIImage(systemName: "circle.grid.hex")!
    }

    class var blog: UIImage {
        UIImage(systemName: "paperplane")!
    }
    
    class var articlesFilled: UIImage {
        UIImage(systemName: "circle.grid.hex.fill")!
    }

    class var blogFilled: UIImage {
        UIImage(systemName: "paperplane.fill")!
    }

}
