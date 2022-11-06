//
//  ProfileGuestViewController.swift
//  onetwo
//
//  Created by Alex Provarenko on 02.11.2022.
//

import UIKit

class ProfileGuestViewController: UIViewController {
    
    private let actionSpacing: CGFloat = 30
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1

        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(ProfileGuestCollectionViewCell.self, forCellWithReuseIdentifier: ProfileGuestCollectionViewCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .systemBackground
        collection.bounces = false
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    private let profileBackgroundImage: UIImageView = {
        let bg = UIImageView()
        bg.image = UIImage(named: "Login")
        bg.contentMode = .scaleAspectFill
        bg.clipsToBounds = true
        bg.translatesAutoresizingMaskIntoConstraints = false
        return bg
    }()
    
    private let profileView: UIView = {
        let profileView = UIView()
        profileView.backgroundColor = .white
        profileView.layer.shadowColor = UIColor.black.cgColor
        profileView.layer.shadowOpacity = 0.30
        profileView.layer.shadowOffset = .zero
        profileView.layer.shadowRadius = 10
        profileView.layer.cornerRadius = 15
        profileView.translatesAutoresizingMaskIntoConstraints = false
        return profileView
    }()
        
    private let profileAvatarImageButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "profileImage"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 50
        return button
    }()
    
    private let profileNameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont(name: "Avenir-Medium", size: 20)
        nameLabel.text = "@TipsForLife"
        nameLabel.textColor = .black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    private let followingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Regular", size: 15)
        label.text = "Following"
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let followingCountButton: UIButton = {
        let button = UIButton()
        let atributedTitle = NSMutableAttributedString(string: "50", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 30),NSAttributedString.Key.foregroundColor: UIColor.black])
        button.setAttributedTitle(atributedTitle, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let followersLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Regular", size: 15)
        label.text = "Followers"
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let followersCountButton: UIButton = {
        let button = UIButton()
        let atributedTitle = NSMutableAttributedString(string: "1500", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 30),NSAttributedString.Key.foregroundColor: UIColor.black])
        button.setAttributedTitle(atributedTitle, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let likeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Regular", size: 15)
        label.text = "Likes"
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let likeCountButton: UIButton = {
        let button = UIButton()
        let atributedTitle = NSMutableAttributedString(string: "30", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 30),NSAttributedString.Key.foregroundColor: UIColor.black])
        button.setAttributedTitle(atributedTitle, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let subscribeProfileButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Subscribe", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(profileBackgroundImage)
        view.addSubview(profileView)
        view.addSubview(profileAvatarImageButton)
        view.addSubview(profileNameLabel)
        view.addSubview(followingLabel)
        view.addSubview(followingCountButton)
        view.addSubview(followersLabel)
        view.addSubview(followersCountButton)
        view.addSubview(likeLabel)
        view.addSubview(likeCountButton)
        view.addSubview(subscribeProfileButton)
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    
        configureConstraints()
    }
    
    //MARK: - Configure Constraints
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            profileBackgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            profileBackgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileBackgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileBackgroundImage.heightAnchor.constraint(equalToConstant: 270),
            
            profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            profileView.widthAnchor.constraint(equalToConstant: 400),
            profileView.heightAnchor.constraint(equalToConstant: 280),
            profileView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            profileAvatarImageButton.topAnchor.constraint(equalTo: profileView.topAnchor, constant: -50),
            profileAvatarImageButton.centerXAnchor.constraint(equalTo: profileView.centerXAnchor),
            profileAvatarImageButton.widthAnchor.constraint(equalToConstant: 100),
            profileAvatarImageButton.heightAnchor.constraint(equalToConstant: 100),
            
            profileNameLabel.topAnchor.constraint(equalTo: profileAvatarImageButton.bottomAnchor, constant: 10),
            profileNameLabel.centerXAnchor.constraint(equalTo: profileView.centerXAnchor),
            
            followersLabel.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor, constant: 20),
            followersLabel.centerXAnchor.constraint(equalTo: profileView.centerXAnchor),
            
            followersCountButton.topAnchor.constraint(equalTo: followersLabel.bottomAnchor, constant: 2),
            followersCountButton.centerXAnchor.constraint(equalTo: followersLabel.centerXAnchor),
            
            followingLabel.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor, constant: 20),
            followingLabel.trailingAnchor.constraint(equalTo: followersLabel.leadingAnchor, constant: -actionSpacing),
            
            followingCountButton.topAnchor.constraint(equalTo: followingLabel.bottomAnchor, constant: 2),
            followingCountButton.centerXAnchor.constraint(equalTo: followingLabel.centerXAnchor),
            
            likeLabel.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor, constant: 20),
            likeLabel.leadingAnchor.constraint(equalTo: followersLabel.trailingAnchor, constant: actionSpacing),
            
            likeCountButton.topAnchor.constraint(equalTo: likeLabel.bottomAnchor, constant: 2),
            likeCountButton.centerXAnchor.constraint(equalTo: likeLabel.centerXAnchor),
            
            subscribeProfileButton.topAnchor.constraint(equalTo: followersCountButton.bottomAnchor, constant: 15),
            subscribeProfileButton.centerXAnchor.constraint(equalTo: profileView.centerXAnchor),
            subscribeProfileButton.widthAnchor.constraint(equalToConstant: 200),
            subscribeProfileButton.heightAnchor.constraint(equalToConstant: 50),
            
            collectionView.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 30),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

//MARK: - Extension CollectionViewCell

extension ProfileGuestViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileGuestCollectionViewCell.identifier, for: indexPath) as? ProfileGuestCollectionViewCell else {return UICollectionViewCell()}
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width / 3) - 1, height: (view.frame.size.height / 5) - 1)
    }
    
}
