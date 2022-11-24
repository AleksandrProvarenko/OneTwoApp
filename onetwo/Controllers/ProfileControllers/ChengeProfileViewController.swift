//
//  ChengeProfileViewController.swift
//  onetwo
//
//  Created by Alex Provarenko on 15.11.2022.
//

import UIKit

class ChengeProfileViewController: UIViewController {
    
    //MARK: - created TableView
    
    private let mainTapleView: UITableView = {
        let tableView = UITableView()
        tableView.register(ChangeProfileTableViewCell.self, forCellReuseIdentifier: ChangeProfileTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.alwaysBounceVertical = false
        return tableView
    }()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .red
        return view
    }()
    
    private let profileBackgroundImageView: UIImageView = {
        let bg = UIImageView()
        bg.image = UIImage(named: "Login")
        bg.contentMode = .scaleAspectFill
        bg.clipsToBounds = true
        bg.layer.masksToBounds = true
        bg.translatesAutoresizingMaskIntoConstraints = false
        return bg
    }()
    
    
    private let profileAvatarImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "profileImage")
        view.contentMode = .scaleAspectFill
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 50
        return view
    }()
    
    private let addNewPhotoButton: UIButton = {
        let button = UIButton(configuration: .filled())
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .light, scale: .small)
        let cameraButton = UIImage(systemName: "camera", withConfiguration: largeConfig)
        button.setImage(cameraButton, for: .normal)
        button.tintColor = .white
        button.configuration?.baseBackgroundColor = .black
        button.alpha = 0.5
        button.imageView?.contentMode = .scaleAspectFill
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 50
        return button
    }()
    
    private let changePhotoLabel: UILabel = {
        let label = UILabel()
        label.text = "change photo"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private let titleTableViewLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.text = "About you"
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(backgroundView)
        view.addSubview(profileBackgroundImageView)
        view.addSubview(profileAvatarImageView)
        view.addSubview(addNewPhotoButton)
        view.addSubview(changePhotoLabel)
        view.addSubview(titleTableViewLabel)
        view.addSubview(mainTapleView)

        mainTapleView.delegate = self
        mainTapleView.dataSource = self
        
        configureConstraints()
        addButtonTarget()
    }
    

    //MARK: - Create button target
    
    private func addButtonTarget() {
        addNewPhotoButton.addTarget(self, action: #selector(addNewPhotoButtonTap), for: .touchUpInside)
    }
    
    @objc func addNewPhotoButtonTap() {
        print("addNewPhotoButtonTap")
    }
    
    //MARK: - Constraints
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 330),
            
            profileBackgroundImageView.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            profileBackgroundImageView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            profileBackgroundImageView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            profileBackgroundImageView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            
            profileAvatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            profileAvatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileAvatarImageView.heightAnchor.constraint(equalToConstant: 100),
            profileAvatarImageView.widthAnchor.constraint(equalToConstant: 100),
            
            addNewPhotoButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            addNewPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addNewPhotoButton.widthAnchor.constraint(equalToConstant: 100),
            addNewPhotoButton.heightAnchor.constraint(equalToConstant: 100),
            
            changePhotoLabel.topAnchor.constraint(equalTo: profileAvatarImageView.bottomAnchor, constant: 10),
            changePhotoLabel.centerXAnchor.constraint(equalTo: profileAvatarImageView.centerXAnchor),
            
            titleTableViewLabel.topAnchor.constraint(equalTo: profileBackgroundImageView.bottomAnchor, constant: 20),
            titleTableViewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            mainTapleView.topAnchor.constraint(equalTo: titleTableViewLabel.bottomAnchor, constant: 20),
            mainTapleView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 15),
            mainTapleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            mainTapleView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)

        ])}
    
}

extension ChengeProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChangeProfileTableViewCell.identifier, for: indexPath) 
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = ProfileChangeNameViewController()
        controller.modalPresentationStyle = .automatic
        navigationController?.pushViewController(controller, animated: true)
        mainTapleView.deselectRow(at: indexPath, animated: true)
    }


}
