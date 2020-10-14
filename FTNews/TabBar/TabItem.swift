//
//  TabItem.swift
//  FTNews
//
//  Created by Andrey Leganov on 30.09.2020.
//  Copyright © 2020 Леганов Андрей. All rights reserved.
//

import UIKit

enum TabItem: String, CaseIterable {
    case search = "Search"
    case today = "Today"
    case myFT = "myFT"
    case menu = "Menu"
    
    var viewController: UIViewController {
        switch self  {
        
        case .search:
            return SearchViewController()
        case .today:
            return TodayViewController()
        case .myFT:
            return MyFTViewController()
        case .menu:
            return MenuViewController()
        }
    }
    
    var icon: UIImage {
        switch self {
        
        case .search:
            return #imageLiteral(resourceName: "search_tab_bar_icon")
        case .today:
            return #imageLiteral(resourceName: "today_tab_bar_icon")
        case .myFT:
            return #imageLiteral(resourceName: "myft_tab_bar_icon")
        case .menu:
            return #imageLiteral(resourceName: "menu_tab_bar_icon")
        }
    }
    
    var displayTitle: String {
        return self.rawValue
    }
    
}
