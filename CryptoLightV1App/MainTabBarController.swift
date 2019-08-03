//
//  MainTabBarController.swift
//  CryptoLightV1App
//
//  Created by Richard Price on 31/07/2019.
//  Copyright © 2019 twisted echo. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        setupNavigationBarCustomisation()
        setTabBar()
        
        
    }
    
    private func setupNavigationBarCustomisation() {
        
        UINavigationBar.appearance().prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blue, NSAttributedString.Key.font: UIFont(name: "systemFont", size: 15) ?? UIFont.systemFont(ofSize: 30)]
        
    }
    
    private func setTabBar() {
        
        viewControllers = [
        
            generateNavController(with: UIViewController(), title: "News", image: #imageLiteral(resourceName: "news")),
            generateNavController(with: CoinsController(), title: "Prices", image: #imageLiteral(resourceName: "prices"))
        ]
        
        tabBar.tintColor = UIColor.rgb(red: 51, green: 212, blue: 128)
        tabBar.isTranslucent = true
        tabBar.barTintColor = .clear
        
    }
    
    private func generateNavController(with rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
    
    private func test() {
        
        
        
    }
    
    private func testPart3() {
        
        
        
    }
    
    
}
