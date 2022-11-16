//
//  ProfileViewController.swift
//  onetwo
//
//  Created by Alex Provarenko on 23.09.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let actionSpacing: CGFloat = 30
    
    let horizontalMenu = HorizontalMenuBattonUIView()
    let collors: [UIColor] = [.systemBlue, .purple]
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0

        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(ProfileFavoriteVodeoCollectionViewCell.self, forCellWithReuseIdentifier: ProfileFavoriteVodeoCollectionViewCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .systemBackground
        collection.isPagingEnabled = true
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
    
    private let chengeProfileButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Edit profile", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .none
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(profileBackgroundImage)
        view.backgroundColor = .white
        view.addSubview(profileView)
        view.addSubview(profileAvatarImageButton)
        view.addSubview(profileNameLabel)
        view.addSubview(followingLabel)
        view.addSubview(followingCountButton)
        view.addSubview(followersLabel)
        view.addSubview(followersCountButton)
        view.addSubview(likeLabel)
        view.addSubview(likeCountButton)
        view.addSubview(chengeProfileButton)
        view.addSubview(horizontalMenu)
        view.addSubview(collectionView)
        horizontalMenu.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        horizontalMenu.delegate = self
    
        configureConstraints()
        configureProfileImageButton()
     
    }
    
    //MARK: - TargetButtonProfileAvatar
    
    func configureProfileImageButton() {
        profileAvatarImageButton.addTarget(self, action: #selector(profButtonTap), for: .touchUpInside)
        followersCountButton.addTarget(self, action: #selector(followersButtonTap), for: .touchUpInside)
        followingCountButton.addTarget(self, action: #selector(followingButtonTap), for: .touchUpInside)
        likeCountButton.addTarget(self, action: #selector(likeButtonTap), for: .touchUpInside)
        chengeProfileButton.addTarget(self, action: #selector(chengeProfileTap), for: .touchUpInside)
    }
    
    @objc func profButtonTap() {
        print("profButtonTap")
    }
    
    @objc func followersButtonTap() {
        let controller = ProfileFollowersButtonViewController()
        controller.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(controller, animated: true)
        print("followersButtonTap")
    }
    
    @objc func followingButtonTap() {
        let controller = ProfileFollowingButtonViewController()
        controller.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(controller, animated: true)
        print("followingButtonTap")
    }
    
    @objc func likeButtonTap() {
        print("likeButtonTap")
    }
    
    @objc func chengeProfileTap() {
        let controller = ChengeProfileViewController()
        controller.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: - Constraints
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            
            profileBackgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            profileBackgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileBackgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileBackgroundImage.heightAnchor.constraint(equalToConstant: 300),
            
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
            
            chengeProfileButton.topAnchor.constraint(equalTo: followersCountButton.bottomAnchor, constant: 15),
            chengeProfileButton.centerXAnchor.constraint(equalTo: profileView.centerXAnchor),
            chengeProfileButton.widthAnchor.constraint(equalToConstant: 200),
            chengeProfileButton.heightAnchor.constraint(equalToConstant: 50),
            
            horizontalMenu.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 15),
            horizontalMenu.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            horizontalMenu.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            horizontalMenu.heightAnchor.constraint(equalToConstant: 40),
            
            collectionView.topAnchor.constraint(equalTo: horizontalMenu.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        ])
    }
    
}

//MARK: - Extantion CollectionView

extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return collors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileFavoriteVodeoCollectionViewCell.identifier, for: indexPath) as! ProfileFavoriteVodeoCollectionViewCell
        
        cell.backgroundColor = collors[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: view.frame.width, height: collectionView.frame.height)
      }
  
      func scrollViewDidScroll(_ scrollView: UIScrollView) {
          horizontalMenu.scrollIndicator(to: scrollView.contentOffset)
      }
}

//MARK: - Extention HorizontalMenuBattonDelegate

extension ProfileViewController: HorizontalMenuBattonDelegate {
    func didSelectItem(index: Int) {
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.scrollToItem(at: indexPath, at: [], animated: true)
    }
}
    
    

