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
        let firstVC = HomeViewController()
        let secondVC = SecondTabBarVC()
        let thirdVC = CalculatorViewController()
        
        let firstNavigationController = UINavigationController(rootViewController: firstVC)
        let secondNavigationController = UINavigationController(rootViewController: secondVC)
        let thirdNavigationcontroller = UINavigationController(rootViewController: thirdVC)
        
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
        
        thirdNavigationcontroller.tabBarItem = UITabBarItem(
            title: "Calculator",
            image: UIImage(systemName: "clear"),
            selectedImage: UIImage(systemName: "clear.fill")
        )
        
        viewControllers = [thirdNavigationcontroller, firstNavigationController, secondNavigationController]
        selectedIndex = 1
        
    }
}
