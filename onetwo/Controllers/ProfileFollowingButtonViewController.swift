//
//  ProfileFollowingButtonViewControllers.swift
//  onetwo
//
//  Created by Alex Provarenko on 08.11.2022.
//

import UIKit

class ProfileFollowingButtonViewController: UIViewController {
    
    private let mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ProfileFollowingButtonTableViewCell.self, forCellReuseIdentifier:ProfileFollowingButtonTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainTableView)
        
        mainTableView.dataSource = self
        mainTableView.delegate = self
        
        configureNavigatonBar()
        configureConstraints()
    }
    
    //MARK: - viewDidLayoutSubviewsMainTableView
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainTableView.frame = view.bounds

    }
    
    //MARK: - configureNavigatonBar
    
    private func configureNavigatonBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.tintColor = .label
        
    }
    
    //MARK: - configureConstraints
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

//MARK: - extension maintTableView

extension ProfileFollowingButtonViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileFollowingButtonTableViewCell.identifier, for: indexPath) as? ProfileFollowingButtonTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    
}
