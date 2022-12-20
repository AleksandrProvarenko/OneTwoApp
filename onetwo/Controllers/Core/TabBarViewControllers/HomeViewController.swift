//
//  HomeViewController.swift
//  onetwo
//
//  Created by Alex Provarenko on 23.09.2022.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {

    let video: [Video] = Video.fetchVideo()
    var commentsPresController = HomeCommentsPresentationControllerTableView()
    
    lazy var collectionVideoView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(HomeVideoCollectionViewCell.self, forCellWithReuseIdentifier: HomeVideoCollectionViewCell.identidier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .systemBackground
        collection.isPagingEnabled = true
        collection.bounces = false
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(collectionVideoView)
       
        collectionVideoView.delegate = self
        collectionVideoView.dataSource = self
       
        configureConstraints()
        configureNavigationBar()
    }
    
    //MARK: - CollectionViewDidLayoutSubviews
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionVideoView.frame = view.bounds
    }

    //MARK: - configureNavigationBar
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - Configure Constraints
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            collectionVideoView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionVideoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionVideoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionVideoView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

//MARK: - Extantion CollectionViewDelegatem, CollectionViewDataSource

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return video.count
    }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeVideoCollectionViewCell.identidier, for: indexPath) as! HomeVideoCollectionViewCell
        
            let video = video[indexPath.row]
            cell.configureVideo(with: video)
            cell.delegate = self
            return cell
            
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: view.frame.width, height: view.frame.height)
        }
        
    }

//MARK: - CollectionViewCellDelegate, sheetPresentationController, pushVCtoProfileGuestVC

extension HomeViewController: HomeVideoCollectionViewCellDelegate {
    
    func userProfileImageButtonTap() {
        let controller = ProfileGuestViewController()
        controller.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(controller, animated: true)
    }

    func didTapLikeButton() {
        print("like")
    }
    
    func didTapCommentsButton() {
        if let sheet = self.commentsPresController.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
        }
        
        present(self.commentsPresController, animated: true)
    
    }
    
    func didTapFavoriteVideoButton() {
        print("Favorite")
    }
    
}

