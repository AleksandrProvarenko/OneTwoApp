//
//  ProfileGuestCollectionViewCell.swift
//  onetwo
//
//  Created by Alex Provarenko on 02.11.2022.
//

import UIKit

class ProfileGuestCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ProfileGuestCollectionViewCell"
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemPink
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

