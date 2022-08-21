//
//  BlogsViewController.swift
//  HomeService
//
//  Created by Sergiy Kostrykin on 23.05.2022.
//

import UIKit

class BlogsViewController: UIViewController {
    
    // MARK: - Properties
    private var blogs = [Blog]()
    
    // MARK: - UI
    private lazy var tableView: UITableView = {
        var table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        table.delegate = self
        table.dataSource = self
        table.register(cells: [R.reuseIdentifier.blogTableViewCell.identifier])
        
        return table
    }()
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        buildUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        blogsRequest()
    }

}

private extension BlogsViewController {
    func buildUI() {
        tableView.embed(in: self.view)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func showBlog(blog: Blog) {
        UIApplication.openUrl(blog.url)
    }
    
    // MARK: - Requests
    func blogsRequest() {
        BlogNetworkingService.blogs { [weak self] blogs, error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.blogs = blogs ?? []
                self.reloadData()
            }
        }
    }
    
}

extension BlogsViewController: UITableViewDataSource, UITableViewDelegate {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        blogs.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
                
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let blog = blogs[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.blogTableViewCell, for: indexPath)!
        cell.setup(blog: blog)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let blog = blogs[indexPath.row]
        showBlog(blog: blog)
    }

}
