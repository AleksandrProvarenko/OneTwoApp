//
//  IntrestingCollectionViewCell.swift
//  onetwo
//
//  Created by Alex Provarenko on 12.10.2022.
//

import UIKit

class IntrestingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "IntrestingCollectionViewCell"
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemPink
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
