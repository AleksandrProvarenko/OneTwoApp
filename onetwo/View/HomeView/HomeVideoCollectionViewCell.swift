//
//  HomeVideoCollectionViewCell.swift
//  onetwo
//
//  Created by Alex Provarenko on 14.10.2022.
//

import UIKit
import AVFoundation
import AVKit

//MARK: - Delegate

protocol HomeVideoCollectionViewCellDelegate: AnyObject {
    func userProfileImageButtonTap()
    func didTapLikeButton()
    func didTapCommentsButton()
    func didTapFavoriteVideoButton()
}

class HomeVideoCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: HomeVideoCollectionViewCellDelegate?
    
    static let identidier = "HomeVideoCollectionViewCell"
    var player = AVPlayer()
        
    private let userProfileImageViewButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "profileImage"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.masksToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 30
        return button
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .medium, scale: .medium)
        let likeButton = UIImage(systemName: "heart.fill", withConfiguration: largeConfig)
        button.setImage(likeButton, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let likeCountLabel: UILabel = {
        let label = UILabel()
        label.text = "350"
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let commentsButton: UIButton = {
        let button = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .medium, scale: .medium)
        let likeButton = UIImage(systemName: "ellipsis.message", withConfiguration: largeConfig)
        button.setImage(likeButton, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let commentsCountLabel: UILabel = {
        let label = UILabel()
        label.text = "20"
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let favoriteButton: UIButton = {
        let button = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .medium, scale: .medium)
        let likeButton = UIImage(systemName: "bookmark.fill", withConfiguration: largeConfig)
        button.setImage(likeButton, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let favoriteCountLabel: UILabel = {
        let label = UILabel()
        label.text = "3860"
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let configireVideoView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    //MARK: - Initializatin UICollectionViewCell
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        contentView.backgroundColor = .black
        contentView.addSubview(configireVideoView)
        contentView.addSubview(userProfileImageViewButton)
        contentView.addSubview(likeButton)
        contentView.addSubview(likeCountLabel)
        contentView.addSubview(commentsButton)
        contentView.addSubview(commentsCountLabel)
        contentView.addSubview(favoriteButton)
        contentView.addSubview(favoriteCountLabel)
    
        configureConstraints()
        confugireButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    //MARK: - layoutSubviews for configureVideoView
    
    override func layoutSubviews() {
        configireVideoView.frame = contentView.bounds
    }
    
    //MARK: - Configure video func with AVPlayer
    
    public func configureVideo(with model: Video) {
        let video = model
        let path = Bundle.main.path(forResource: video.videoName, ofType: "mp4")
        let videoUrl = URL(fileURLWithPath: path!)
        let player = AVPlayer(url: videoUrl as URL)
        let playerLayer = AVPlayerLayer(player: player)
        self.configireVideoView.layer.addSublayer(playerLayer)
        playerLayer.frame = self.bounds
        player.volume = 0
        player.play()

    }
    
    //MARK: - Congigure func Button Targets
    
    private func confugireButtons() {
        userProfileImageViewButton.addTarget(self, action: #selector(userProfileImageButtonTap), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(didTapLikeButton), for: .touchUpInside)
        commentsButton.addTarget(self, action: #selector(didTapCommentsButton), for: .touchUpInside)
        favoriteButton.addTarget(self, action: #selector(didTapFavoriteVideoButton), for: .touchUpInside)
    }
    
    @objc func userProfileImageButtonTap() {
        delegate?.userProfileImageButtonTap()
        
    }
    
    @objc func didTapLikeButton() {
        delegate?.didTapLikeButton()
        
    }
    
    @objc func didTapCommentsButton() {
        delegate?.didTapCommentsButton()
        
    }
    
    @objc func didTapFavoriteVideoButton() {
        delegate?.didTapFavoriteVideoButton()
    }
    

    //MARK: - Configure Constraints
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            userProfileImageViewButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            userProfileImageViewButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            userProfileImageViewButton.widthAnchor.constraint(equalToConstant: 60),
            userProfileImageViewButton.heightAnchor.constraint(equalToConstant: 60),
            
            likeButton.topAnchor.constraint(equalTo: userProfileImageViewButton.bottomAnchor, constant: 20),
            likeButton.centerXAnchor.constraint(equalTo: userProfileImageViewButton.centerXAnchor),
            
            likeCountLabel.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 5),
            likeCountLabel.centerXAnchor.constraint(equalTo: likeButton.centerXAnchor),
            
            commentsButton.topAnchor.constraint(equalTo: likeCountLabel.bottomAnchor, constant: 15),
            commentsButton.centerXAnchor.constraint(equalTo:likeCountLabel.centerXAnchor),
            
            commentsCountLabel.topAnchor.constraint(equalTo: commentsButton.bottomAnchor, constant: 5),
            commentsCountLabel.centerXAnchor.constraint(equalTo:commentsButton.centerXAnchor),
            
            favoriteButton.topAnchor.constraint(equalTo: commentsCountLabel.bottomAnchor, constant: 15),
            favoriteButton.centerXAnchor.constraint(equalTo: commentsCountLabel.centerXAnchor),
            
            favoriteCountLabel.topAnchor.constraint(equalTo: favoriteButton.bottomAnchor, constant: 5),
            favoriteCountLabel.centerXAnchor.constraint(equalTo: favoriteButton.centerXAnchor)
        ])
    }
    
}
