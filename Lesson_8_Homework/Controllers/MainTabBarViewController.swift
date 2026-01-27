//
//  MainTabBarViewController.swift
//  Lesson_8_Homework
//
//  Created by Egor on 27.01.26.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        
    }
    
    func setupTabs() {
        let firstVC = MainViewController()
        let secondVC = SecondTabBarVC()
        
        let firstNavigationController = UINavigationController(rootViewController: firstVC)
        let secondNavigationController = UINavigationController(rootViewController: secondVC)
        
        firstNavigationController.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
            )
        
        secondNavigationController.tabBarItem = UITabBarItem(
            title: "Time",
            image: UIImage(systemName: "clock"),
            selectedImage: UIImage(systemName: "clock.fill")
            )
            
        viewControllers = [firstNavigationController, secondNavigationController]
    }
}
