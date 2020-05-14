//
//  MainTabBarController.swift
//  PogodaApi
//
//  Created by Viktor Smirnov on 13.05.2020.
//  Copyright © 2020 Viktor Smirnov. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let searchVC = SearchViewController()
        
        tabBar.tintColor = .red
        tabBar.barTintColor = .blue
        
        
        guard let musicImage = UIImage(systemName: "music.house") else { return }
        viewControllers = [generationNC(rootViewController: searchVC, image: musicImage, title: "Музыка")]
        
        
    }
    
    func generationNC(rootViewController: UIViewController, image: UIImage, title: String) -> UINavigationController {
           
           let navigationVC = UINavigationController(rootViewController: rootViewController)
           
           navigationVC.tabBarItem.title = title
           navigationVC.tabBarItem.image = image
           navigationVC.navigationBar.prefersLargeTitles = true
           
           
           
           return navigationVC
       }
   

}
