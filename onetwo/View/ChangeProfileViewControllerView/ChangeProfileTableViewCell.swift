//
//  ChangeProfileTableViewCell.swift
//  onetwo
//
//  Created by Alex Provarenko on 17.11.2022.
//

import UIKit

class ChangeProfileTableViewCell: UITableViewCell {
    
    static let identifier = "ChangeProfileTableViewCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.text = "Your name"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let navigationImage: UIImageView = {
        let image = UIImageView()
        let configuration = UIImage.SymbolConfiguration(pointSize: 15, weight: .medium, scale: .medium)
        image.image = UIImage(systemName: "control", withConfiguration: configuration)
        image.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        image.tintColor = .lightGray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.text = "TipsForLife"
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(titleLabel)
        contentView.addSubview(navigationImage)
        contentView.addSubview(userNameLabel)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            userNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            userNameLabel.trailingAnchor.constraint(equalTo: navigationImage.leadingAnchor, constant: -10),
            userNameLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            
            navigationImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3.5),
            navigationImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
}
