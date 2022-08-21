//
//  BlogTableViewCell.swift
//  HomeService
//
//  Created by Sergiy Kostrykin on 24.05.2022.
//

import UIKit
import Kingfisher

class BlogTableViewCell: UITableViewCell {

    @IBOutlet weak var blogImageView: UIImageView!
    @IBOutlet weak var blogTitleLabel: UILabel!
    @IBOutlet weak var blogDetailsLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        blogImageView.layer.cornerRadius = 10
    }

    func setup(blog: Blog) {
        blogTitleLabel.text = blog.title
        blogDetailsLabel.text = blog.summary
        createdAtLabel.text = blog.publishedAt?.createdAtDateString
        blogImageView.kf.setImage(with: blog.imageUrl?.url, placeholder: UIImage.placeholder)
    }
}
