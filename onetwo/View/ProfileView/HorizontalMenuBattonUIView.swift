//
//  HorizontalMenuBatton.swift
//  onetwo
//
//  Created by Alex Provarenko on 07.10.2022.
//

import UIKit

protocol HorizontalMenuBattonDelegate: AnyObject {
    func didSelectItem(index: Int)
}

class HorizontalMenuBattonUIView: UIView {
    
    weak var delegate: HorizontalMenuBattonDelegate?
    
    let videButton: UIButton!
    let likeButton: UIButton!
    let allBattons: [UIButton]!
    
    let indicator = UIView()
    
    var indicatorLeading: NSLayoutConstraint?
    var indictorTrailing: NSLayoutConstraint?
    
    let leadingPadding: CGFloat = 160
    let buttonSpace: CGFloat = 15
    
    private let privateVideoButoon: UIButton = {
        let button = UIButton()
        button.configuration = .tinted()
        button.configuration?.baseForegroundColor = .black
        button.configuration?.baseBackgroundColor = .white
        button.configuration?.image = UIImage(systemName: "lock")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let likeVideoButoon: UIButton = {
        let button = UIButton()
        button.configuration = .tinted()
        button.configuration?.baseForegroundColor = .black
        button.configuration?.baseBackgroundColor = .white
        button.configuration?.image = UIImage(systemName: "heart")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        videButton = privateVideoButoon
        likeButton = likeVideoButoon
        allBattons = [videButton, likeButton]
        super.init(frame: .zero)
        
        videButton.addTarget(self, action: #selector(videButtonTapped), for: .primaryActionTriggered)
        likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .primaryActionTriggered)
        
        styleIndicator()
        setAlpha(for: videButton)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    private func styleIndicator() {
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.backgroundColor = .red
    }
    
    private func setConstraints() {
        addSubview(videButton)
        addSubview(likeButton)
        addSubview(indicator)
        
        NSLayoutConstraint.activate([
            videButton.topAnchor.constraint(equalTo: topAnchor),
            videButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leadingPadding),
            
            likeButton.topAnchor.constraint(equalTo: topAnchor),
            likeButton.leadingAnchor.constraint(equalTo: videButton.trailingAnchor, constant: buttonSpace),
            
            indicator.bottomAnchor.constraint(equalTo: bottomAnchor),
            indicator.heightAnchor.constraint(equalToConstant: 3)
            
        ])
        
        indicatorLeading = indicator.leadingAnchor.constraint(equalTo: videButton.leadingAnchor)
        indictorTrailing = indicator.trailingAnchor.constraint(equalTo: videButton.trailingAnchor)
        
        indicatorLeading?.isActive = true
        indictorTrailing?.isActive = true
        
    }
  
}

extension HorizontalMenuBattonUIView {
    @objc func videButtonTapped() {
        delegate?.didSelectItem(index: 0)
    }

    @objc func likeButtonTapped() {
        delegate?.didSelectItem(index: 1)
    }

}

//MARK: - Extension hotizontal button and animated indicator

extension HorizontalMenuBattonUIView {
    func selectItem(at index: Int) {
        animatedIndicator(to: index)
    }
    
    private func animatedIndicator(to index: Int) {
        var button: UIButton
        switch index {
        case 0:
            button = videButton
        case 1:
            button = likeButton
        default:
            button = videButton
        }
        
        setAlpha(for: button)
        
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    
    private func setAlpha(for button: UIButton) {
        videButton.alpha = 0.3
        likeButton.alpha = 0.3

        button.alpha = 1.0
    }
    
    //MARK: - Determine percent scrolled relative to index
    
    func scrollIndicator(to contentOffset: CGPoint) {
        let index = Int(contentOffset.x / frame.width)
        let atScrollStart = Int(contentOffset.x) % Int(frame.width) == 0
        
        if atScrollStart {
            return
        }
        
        let persentScrolled: CGFloat
        switch index {
        case 0:
            persentScrolled = contentOffset.x / frame.width - 0
        case 1:
            persentScrolled = contentOffset.x / frame.width - 1
        default:
            persentScrolled = contentOffset.x / frame.width
        }
        
        //MARK: - Determine buttons
        
        var fromButton: UIButton
        var toButton: UIButton
        
        switch index {
        case 1:
            fromButton = allBattons[index]
            toButton = allBattons[index - 1]
        default:
            fromButton = allBattons[index]
            toButton = allBattons[index + 1]
        }
        
        //MARK: - Animate alpha of buttons
        
        switch index {
        case 1:
            break
        default:
            fromButton.alpha = fmax(0.5, (1 - persentScrolled))
            toButton.alpha = fmax(0.5, persentScrolled)
        }
        
        let fromWidth = fromButton.frame.width
        let toWidth = toButton.frame.width
        
        //MARK: - Determine width
        
        let sectionWidth: CGFloat
        switch index {
        case 1:
            sectionWidth = leadingPadding + fromWidth + buttonSpace
        default:
            sectionWidth = fromWidth + buttonSpace
        }
        
        //MARK: - Normalize X scroll
        
        let sectionFraction = sectionWidth / frame.width
        let x = contentOffset.x * sectionFraction
        
        let buttonWidthDiff = fromWidth - toWidth
        let widthOfSet = buttonWidthDiff * persentScrolled
        
        //MARK: - Determine leading Y
        
        let y: CGFloat
        switch index {
        case 0:
            if x < leadingPadding {
               y = x
            } else {
                y = x - leadingPadding * persentScrolled
            }
        case 1:
            y = x + 13
        default:
            y = x
        }
        
        // Note: 13 is button width difference between videoButton and likeButton
        // from previous index. Hard codet for now
        
        indicatorLeading?.constant = y
        
        //MARK: - Determine trailing Y

        let yTrailing: CGFloat
        switch index {
        case 0:
            yTrailing = y - widthOfSet 
        case 1:
            yTrailing = y - widthOfSet - leadingPadding / 2
        default:
            yTrailing = y - widthOfSet - leadingPadding
        }

        indictorTrailing?.constant = yTrailing
        print("\(index) persentScrolled=\(persentScrolled)")
        
    }
    
}
