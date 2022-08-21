//
//  HomeViewController.swift
//  HomeService
//
//  Created by Sergiy Kostrykin on 23.05.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    private let maxServicesEnabled: Int = 3
    private var articles = [Article]()
    private var unfoldedSections = [Int]()
    
    // MARK: - UI
    private lazy var tableView: UITableView = {
        var table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        table.delegate = self
        table.dataSource = self
        table.register(cells: [R.reuseIdentifier.articleTableViewCell.identifier])
        
        return table
    }()
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        buildUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        articlesRequest()
    }
}

private extension HomeViewController {
    func buildUI() {
        tableView.embed(in: self.view)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func showArticle(article: Article) {
        UIApplication.openUrl(article.url)
    }
    
    // MARK: - Requests
    func articlesRequest() {
        ArticlesNetworkingService.articles { [weak self] articles, error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.articles = articles ?? []
                self.reloadData()
            }
        }
    }
        
    func articleLaunchRequest(id: String) {
        ArticlesNetworkingService.articleLaunch(id: id) { [weak self] articles, error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.articles = articles ?? []
                self.reloadData()
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
                
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let article = articles[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.articleTableViewCell, for: indexPath)!
        cell.setup(article: article)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        showArticle(article: article)
    }

}
