//
//  ProfileFollowersButtonTableViewCell.swift
//  onetwo
//
//  Created by Alex Provarenko on 08.11.2022.
//

import UIKit

class ProfileFollowersButtonTableViewCell: UITableViewCell {
    
    static let identifier = "ProfileFollowersButtonTableViewCell"
    
    private let userAvatarImageViewButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "profileImage"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 25
        return button
    }()
    
    private let profileNameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont(name: "System", size: 18)
        nameLabel.text = "TipsForLife"
        nameLabel.textColor = .black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    private let subscribeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Subscribe", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    //MARK: - Initialization UITableViewCell
    
    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(userAvatarImageViewButton)
        contentView.addSubview(profileNameLabel)
        contentView.addSubview(subscribeButton)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - configureConstraints
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([

            userAvatarImageViewButton.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            userAvatarImageViewButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            userAvatarImageViewButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            userAvatarImageViewButton.widthAnchor.constraint(equalToConstant: 50),
            userAvatarImageViewButton.heightAnchor.constraint(equalToConstant: 50),
            
            profileNameLabel.leadingAnchor.constraint(equalTo: userAvatarImageViewButton.trailingAnchor, constant: 10),
            profileNameLabel.centerYAnchor.constraint(equalTo: userAvatarImageViewButton.centerYAnchor),
            
            subscribeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            subscribeButton.centerYAnchor.constraint(equalTo: profileNameLabel.centerYAnchor),
            subscribeButton.widthAnchor.constraint(equalToConstant: 85),
            subscribeButton.heightAnchor.constraint(equalToConstant: 35)
            
        ])
    }
    
}
