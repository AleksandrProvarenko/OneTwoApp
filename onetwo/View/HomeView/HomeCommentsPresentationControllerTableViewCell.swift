//
//  HomeCommentsSheetPresentControllerTableViewCell.swift
//  onetwo
//
//  Created by Alex Provarenko on 24.10.2022.
//

import UIKit


protocol HomeCommentsPresentationControllerDelegate: AnyObject {
    func userAvatarImageTap()
    func userGuestAvatarImageTap()
}

class HomeCommentsPresentationControllerTableViewCell: UITableViewCell {
    
    static var identifier = "HomeCommentsPresentationControllerTableViewCell"
    weak var delegate: HomeCommentsPresentationControllerDelegate?
   
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
    
    private let mainUserName: UILabel = {
        let label = UILabel()
        label.text = "Juli"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mainComment: UILabel = {
        let label = UILabel()
        label.text = "Hello! This is the best video on this subject that I have ever seen!!! It helped me a lot and solved my problem instantly!!! Thanks!!!"
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let replyToCommentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("reply", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .none
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium, scale: .medium)
        let likeButton = UIImage(systemName: "heart", withConfiguration: largeConfig)
        button.setImage(likeButton, for: .normal)
        button.tintColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let likeCountLabel: UILabel = {
        let label = UILabel()
        label.text = "10"
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let userAvatarGuestImageViewButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "HeappyPeople"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        return button
    }()
    
    private let guestUserName: UILabel = {
        let label = UILabel()
        label.text = "Holly"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let guestComment: UILabel = {
        let label = UILabel()
        label.text = "Used this tip! Everything is just great!"
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let replyGuestToCommentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("reply", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .none
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let likeGuestButton: UIButton = {
        let button = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium, scale: .medium)
        let likeButton = UIImage(systemName: "heart", withConfiguration: largeConfig)
        button.setImage(likeButton, for: .normal)
        button.tintColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let likeGuestCountLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let showAllCommentsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("All comments", for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.backgroundColor = .none
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Initialization UITableViewCell
    
    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(userAvatarImageViewButton)
        contentView.addSubview(mainUserName)
        contentView.addSubview(mainComment)
        contentView.addSubview(replyToCommentButton)
        contentView.addSubview(likeButton)
        contentView.addSubview(likeCountLabel)
        contentView.addSubview(userAvatarGuestImageViewButton)
        contentView.addSubview(guestUserName)
        contentView.addSubview(guestComment)
        contentView.addSubview(replyGuestToCommentButton)
        contentView.addSubview(likeGuestButton)
        contentView.addSubview(likeGuestCountLabel)
        contentView.addSubview(showAllCommentsButton)
        
        configureConstraints()
        configureUsersAvatarImageButoons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - configureUsersAvatarImageButoons
    
    private func configureUsersAvatarImageButoons() {
        userAvatarImageViewButton.addTarget(self, action: #selector(userAvatarImageTap), for: .touchUpInside)
        userAvatarGuestImageViewButton.addTarget(self, action: #selector(userGuestAvatarImageTap), for: .touchUpInside)
    }
    
    @objc func userAvatarImageTap() {
        delegate?.userAvatarImageTap()
        print("userAvatarImageTap")
    }
    
    @objc func userGuestAvatarImageTap() {
        delegate?.userGuestAvatarImageTap()
        print("userGuestAvatarImageTap")
    }
    
    //MARK: - configure Constraints
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            
            userAvatarImageViewButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            userAvatarImageViewButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            userAvatarImageViewButton.widthAnchor.constraint(equalToConstant: 50),
            userAvatarImageViewButton.heightAnchor.constraint(equalToConstant: 50),
            
            mainUserName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            mainUserName.leadingAnchor.constraint(equalTo: userAvatarImageViewButton.trailingAnchor, constant: 10),
            
            mainComment.topAnchor.constraint(equalTo: mainUserName.bottomAnchor, constant: 7),
            mainComment.leadingAnchor.constraint(equalTo: userAvatarImageViewButton.trailingAnchor, constant: 10),
            mainComment.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            replyToCommentButton.topAnchor.constraint(equalTo: mainComment.bottomAnchor, constant: 5),
            replyToCommentButton.leadingAnchor.constraint(equalTo: mainComment.leadingAnchor),
            
            likeButton.topAnchor.constraint(equalTo: mainComment.bottomAnchor, constant: 10),
            likeButton.centerYAnchor.constraint(equalTo: replyToCommentButton.centerYAnchor),
            likeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            
            likeCountLabel.topAnchor.constraint(equalTo: mainComment.bottomAnchor, constant: 10),
            likeCountLabel.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor),
            likeCountLabel.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 3),
            
            showAllCommentsButton.topAnchor.constraint(equalTo: replyToCommentButton.bottomAnchor, constant: 5),
            showAllCommentsButton.leadingAnchor.constraint(equalTo: replyToCommentButton.leadingAnchor),
            showAllCommentsButton.widthAnchor.constraint(equalToConstant: 100),
            showAllCommentsButton.heightAnchor.constraint(equalToConstant: 20),
            
            userAvatarGuestImageViewButton.topAnchor.constraint(equalTo: showAllCommentsButton.bottomAnchor, constant: 10),
            userAvatarGuestImageViewButton.leadingAnchor.constraint(equalTo: showAllCommentsButton.leadingAnchor),
            userAvatarGuestImageViewButton.widthAnchor.constraint(equalToConstant: 35),
            userAvatarGuestImageViewButton.heightAnchor.constraint(equalToConstant: 35),
            
            guestUserName.topAnchor.constraint(equalTo: showAllCommentsButton.bottomAnchor, constant: 10),
            guestUserName.leadingAnchor.constraint(equalTo: userAvatarGuestImageViewButton.trailingAnchor, constant: 10),
            
            guestComment.topAnchor.constraint(equalTo: guestUserName.bottomAnchor, constant: 3),
            guestComment.leadingAnchor.constraint(equalTo: guestUserName.leadingAnchor),
            guestComment.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            replyGuestToCommentButton.topAnchor.constraint(equalTo: guestComment.bottomAnchor, constant: 5),
            replyGuestToCommentButton.leadingAnchor.constraint(equalTo: guestComment.leadingAnchor),
            replyGuestToCommentButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            likeGuestButton.topAnchor.constraint(equalTo: guestComment.bottomAnchor, constant: 10),
            likeGuestButton.centerYAnchor.constraint(equalTo: replyGuestToCommentButton.centerYAnchor),
            likeGuestButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            
            likeGuestCountLabel.topAnchor.constraint(equalTo: guestComment.bottomAnchor, constant: 5),
            likeGuestCountLabel.centerYAnchor.constraint(equalTo: likeGuestButton.centerYAnchor),
            likeGuestCountLabel.leadingAnchor.constraint(equalTo: likeGuestButton.trailingAnchor, constant: 3),
            
        ])
    }
    
}
