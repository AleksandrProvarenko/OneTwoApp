//
//  MainTapBarViewController.swift
//  onetwo
//
//  Created by Alex Provarenko on 23.09.2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: InterestingViewController())
        let vc3 = UINavigationController(rootViewController: CameraOnViewController())
        let vc4 = UINavigationController(rootViewController: CommentsViewController())
        let vc5 = UINavigationController(rootViewController: ProfileViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play")
        vc3.tabBarItem.image = UIImage(systemName: "camera.shutter.button")
        vc4.tabBarItem.image = UIImage(systemName: "bubble.left")
        vc5.tabBarItem.image = UIImage(systemName: "person")
        
        vc1.title = "Main"
        vc2.title = "Interesting"
        vc4.title = "Comments"
        vc5.title = "Profile"
        
        tabBar.backgroundColor = .systemBackground
        tabBar.tintColor = .label
        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
    }

}


