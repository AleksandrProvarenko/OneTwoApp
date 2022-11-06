//
//  CommentsTableViewCell.swift
//  onetwo
//
//  Created by Alex Provarenko on 11.10.2022.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {
    
    static let identifier = "CommentsTableViewCell"
    
    var dateUnswerLabel: UILabel = {
        let label = UILabel()
        label.text = "Yesterday"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 13, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var userNameWhoAnswerLabel: UILabel = {
        let label = UILabel()
        label.text = "Mariam"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var userAvatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 25
        imageView.image = UIImage(named: "HeappyPeople")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let unsweredLabel: UILabel = {
        let label = UILabel()
        label.text = "Replide to your comment:"
        label.textColor = .black
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let unsweredMessageLaberl: UILabel = {
        let label = UILabel()
        label.text = "Very helpful advice."
        label.textColor = .black
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 13, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mainUserName: UILabel = {
        let label = UILabel()
        label.text = "AlexRuner:"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mainUserComments: UILabel = {
        let label = UILabel()
        label.text = "I hope my advice has helped you. And with the help of my fairy tales, you can do it."
        label.textColor = .lightGray
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var videoThetWasUnswered: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.image = UIImage(named: "winner")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(dateUnswerLabel)
        contentView.addSubview(userAvatarImageView)
        contentView.addSubview(userNameWhoAnswerLabel)
        contentView.addSubview(videoThetWasUnswered)
        contentView.addSubview(unsweredLabel)
        contentView.addSubview(unsweredMessageLaberl)
        contentView.addSubview(mainUserName)
        contentView.addSubview(mainUserComments)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            dateUnswerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            dateUnswerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            
            userAvatarImageView.topAnchor.constraint(equalTo: dateUnswerLabel.bottomAnchor, constant: 10),
            userAvatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            userAvatarImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            userAvatarImageView.widthAnchor.constraint(equalToConstant: 50),
            userAvatarImageView.heightAnchor.constraint(equalToConstant: 50),
            
            userNameWhoAnswerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 35),
            userNameWhoAnswerLabel.firstBaselineAnchor.constraint(equalTo: userAvatarImageView.firstBaselineAnchor),
            userNameWhoAnswerLabel.leadingAnchor.constraint(equalTo: userAvatarImageView.leadingAnchor, constant: 60),
            
            videoThetWasUnswered.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            videoThetWasUnswered.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            videoThetWasUnswered.widthAnchor.constraint(equalToConstant: 60),
            videoThetWasUnswered.heightAnchor.constraint(equalToConstant: 90),
            
            unsweredLabel.topAnchor.constraint(equalTo: userNameWhoAnswerLabel.bottomAnchor, constant: 5),
            unsweredLabel.leadingAnchor.constraint(equalTo: userNameWhoAnswerLabel.leadingAnchor),
            
            unsweredMessageLaberl.topAnchor.constraint(equalTo: unsweredLabel.bottomAnchor, constant: 2),
            unsweredMessageLaberl.leadingAnchor.constraint(equalTo: unsweredLabel.leadingAnchor),
            unsweredMessageLaberl.trailingAnchor.constraint(equalTo: videoThetWasUnswered.leadingAnchor, constant: -5),
            
            mainUserName.topAnchor.constraint(equalTo: unsweredMessageLaberl.bottomAnchor, constant: 7),
            mainUserName.leadingAnchor.constraint(equalTo: unsweredMessageLaberl.leadingAnchor, constant: 15),
            
            mainUserComments.topAnchor.constraint(equalTo: mainUserName.bottomAnchor, constant: 2),
            mainUserComments.leadingAnchor.constraint(equalTo: mainUserName.leadingAnchor),
            mainUserComments.trailingAnchor.constraint(equalTo: videoThetWasUnswered.leadingAnchor, constant: -5),

        ])
    }
    
    
}
