//
//  VideoForYouViewController.swift
//  onetwo
//
//  Created by Alex Provarenko on 23.09.2022.
//

import UIKit

class InterestingViewController: UIViewController {
    
    private let interestingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(IntrestingCollectionViewCell.self, forCellWithReuseIdentifier: IntrestingCollectionViewCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .systemBackground
        collection.bounces = false
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(interestingCollectionView)
        title = "Best video"
        
        interestingCollectionView.delegate = self
        interestingCollectionView.dataSource = self
        
        configureConstraints() 
    }
    
    //MARK: - CongigureConstraints
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            interestingCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            interestingCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            interestingCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            interestingCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

//MARK: - Extensions CollectionView

extension InterestingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IntrestingCollectionViewCell.identifier, for: indexPath) as? IntrestingCollectionViewCell else { return UICollectionViewCell() }
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width / 3) - 1, height: (view.frame.size.height / 5) - 1)
    }
}
