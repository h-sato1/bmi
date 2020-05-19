//
//  MainTabController.swift
//  MyBMIApp
//
//  Created by 佐藤秀樹 on 2020/04/12.
//  Copyright © 2020年 佐藤秀樹. All rights reserved.
//

import Foundation
import UIKit

class MainTabController: UITabBarController {
    
    override func viewDidLoad() {
        var viewControllers : [UIViewController] = []
        
        let inputViewController = EditViewController()
        let navigationInputViewController = UINavigationController(rootViewController: inputViewController)
        inputViewController.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.mostRecent, tag: 1)
        viewControllers.append(navigationInputViewController)
        
        let historyViewController = HistoryViewController()
        let navigationHistoryViewController = UINavigationController(rootViewController: historyViewController)
        historyViewController.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.mostRecent, tag: 2)
        viewControllers.append(navigationHistoryViewController)
        
        self.setViewControllers(viewControllers, animated: false)
    }
}
