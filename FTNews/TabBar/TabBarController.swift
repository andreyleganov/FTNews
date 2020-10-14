//
//  TabBarController.swift
//  FTNews
//
//  Created by Andrey Leganov on 30.09.2020.
//  Copyright © 2020 Леганов Андрей. All rights reserved.
//

import UIKit
import SnapKit

class TabBarController: UITabBarController {
    
    // MARK: - Variables
    
    var customTabBar: TabNavigationMenu!
    var tabBarHeight: CGFloat = 72.0
    var tabItems: [TabItem] = [.search, .today, .myFT, .menu]
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCustomTabBar(tabItems) { viewControllers in
            self.viewControllers = viewControllers
        }
        
    }
    
    // MARK: - SetupCustomTabBar
    
    func setupCustomTabBar(_ menuItems: [TabItem], completion: @escaping ([UIViewController]) -> Void) {
        let frame = CGRect(x: tabBar.frame.origin.x, y: tabBar.frame.origin.x, width: tabBar.frame.width, height: tabBarHeight)
        var viewControllers = [UIViewController]()
        
        tabBar.isHidden = true
        
        customTabBar = TabNavigationMenu(menuItems: menuItems, frame: frame)
        customTabBar.itemTapped = self.changeTab
        customTabBar.tintColor = UIColor(hex6: 0xA9A9A9)
        
        view.addSubview(customTabBar)
        
        customTabBar.snp.makeConstraints { make in
            make.height.equalTo(tabBarHeight)
            make.leading.equalTo(tabBar.snp.leading).offset(46.0)
            make.trailing.equalTo(tabBar.snp.trailing).inset(46.0)
            make.bottom.equalTo(tabBar.snp.bottom).inset(12.0)
        }
        
        for index in 0 ..< menuItems.count {
            viewControllers.append(menuItems[index].viewController)
        }
        
        view.layoutIfNeeded()
        completion(viewControllers)
    }
    
    func changeTab(tab: Int) {
        selectedIndex = tab
    }
    
}
