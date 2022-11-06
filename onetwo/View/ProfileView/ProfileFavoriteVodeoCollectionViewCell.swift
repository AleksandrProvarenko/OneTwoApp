//
//  ProfileFavoriteVodeoCollectionViewCell.swift
//  onetwo
//
//  Created by Alex Provarenko on 11.10.2022.
//

import UIKit

class ProfileFavoriteVodeoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ProfileFavoriteVodeoCollectionViewCell"
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        contentView.frame = contentView.bounds
    }
    
}
