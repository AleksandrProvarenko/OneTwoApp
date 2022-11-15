//
//  ChengeProfileViewController.swift
//  onetwo
//
//  Created by Alex Provarenko on 15.11.2022.
//

import UIKit

class ChengeProfileViewController: UIViewController {
    
    private let profileBackgroundImage: UIImageView = {
        let bg = UIImageView()
        bg.image = UIImage(named: "Login")
        bg.contentMode = .scaleAspectFill
        bg.clipsToBounds = true
        bg.translatesAutoresizingMaskIntoConstraints = false
        return bg
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(profileBackgroundImage)
        view.backgroundColor = .white
        
        configureConstraints()
    }
    
    //MARK: - Constraints
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            profileBackgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            profileBackgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileBackgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileBackgroundImage.heightAnchor.constraint(equalToConstant: 300),
            
            ])}
        }
