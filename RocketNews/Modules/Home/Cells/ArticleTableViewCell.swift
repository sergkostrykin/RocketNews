//
//  ArticleTableViewCell.swift
//  HomeService
//
//  Created by Sergiy Kostrykin on 24.05.2022.
//

import UIKit
import Kingfisher

class ArticleTableViewCell: UITableViewCell {

    private var thumbnail: String?
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var articleDetailsLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        articleImageView.layer.cornerRadius = 10
    }

    func setup(article: Article) {
        articleTitleLabel.text = article.title
        articleDetailsLabel.text = article.summary
        createdAtLabel.text = article.publishedAt?.createdAtDateString
        articleImageView.kf.setImage(with: article.imageUrl?.url, placeholder: UIImage.placeholder)
    }
}
