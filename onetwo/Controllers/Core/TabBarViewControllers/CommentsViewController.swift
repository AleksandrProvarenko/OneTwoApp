//
//  CommentsViewController.swift
//  onetwo
//
//  Created by Alex Provarenko on 23.09.2022.
//

import UIKit

class CommentsViewController: UIViewController {
    
    private let mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CommentsTableViewCell.self, forCellReuseIdentifier: CommentsTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainTableView)
        title = "Your activity"
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainTableView.frame = view.bounds
    }
    
}

//MARK: - Extension UITableView

extension CommentsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentsTableViewCell.identifier, for: indexPath) as! CommentsTableViewCell
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mainTableView.deselectRow(at: indexPath, animated: true)
    }

}
