//
//  TabNavigationMenu.swift
//  FTNews
//
//  Created by Andrey Leganov on 30.09.2020.
//  Copyright © 2020 Леганов Андрей. All rights reserved.
//

import UIKit

class TabNavigationMenu: UIView {
    
    // MARK: - Variables
    
    var itemTapped: ((_ tab: Int) -> Void)?
    var activeItem: Int = 0
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(menuItems: [TabItem], frame: CGRect) {
        self.init(frame: frame)
        
        isUserInteractionEnabled = true
        backgroundColor = UIColor(hex6: 0xFFF1E4, alpha: 0.9)
        layer.cornerRadius = 16.0
        layer.shadowColor = UIColor(hex6: 0x221D23).cgColor
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 0, height: 0)

        for index in 0 ..< menuItems.count {
            let leadingOffset = 62 * CGFloat(index) + 7 * CGFloat(index + 1)

            let itemView = createTabItemView(item: menuItems[index])
            itemView.tag = index

            addSubview(itemView)

            itemView.snp.makeConstraints { make in
                make.size.equalTo(CGSize(width: 62.0, height: 58.0))
                make.centerY.equalToSuperview()
                make.leading.equalToSuperview().offset(leadingOffset)

            }
        }
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
        self.activate(tab: 1)
    }
    
    // MARK: - Create Custom Nav Menu Item

    func createTabItemView(item: TabItem) -> UIView {
        let tabBarItemView = UIView(frame: .zero)
        let itemTitleLabel = UILabel(frame: .zero)
        let itemIconView = UIImageView(frame: .zero)

        itemTitleLabel.text = item.displayTitle
        itemTitleLabel.font = UIFont.systemFont(ofSize: 9.0, weight: .regular)
        itemTitleLabel.textAlignment = .center

        itemIconView.image = item.icon.withRenderingMode(.alwaysTemplate)
        itemIconView.contentMode = .scaleAspectFill

        tabBarItemView.layer.backgroundColor = UIColor.clear.cgColor
        tabBarItemView.layer.cornerRadius = 12.0
        tabBarItemView.addSubview(itemIconView)

        itemIconView.snp.remakeConstraints { make in
            make.size.equalTo(CGSize(width: 26.0, height: 26.0))
            make.center.equalToSuperview()
        }

        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(self.handleTap))

        tabBarItemView.addGestureRecognizer(tap)

        return tabBarItemView
    }
    
    // MARK: - Handler
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        
        guard activeItem != sender.view!.tag else {
            return
        }
        
        switchTab(from: activeItem, to: sender.view!.tag)
    }
        
    func switchTab(from: Int, to: Int) {
        deactivate(tab: from)
        activate(tab: to)
    }
    
    func activate(tab: Int) {
        let tabBarItemView = self.subviews[tab]
        
        DispatchQueue.main.async {
            
            self.itemTapped?(tab)
            self.activeItem = tab
            
            UIView.animate(withDuration: 0.1, delay: 0.0, options: .allowUserInteraction) {
                
                tabBarItemView.layer.shadowOpacity = 0.5
                tabBarItemView.layer.shadowRadius = 5
                tabBarItemView.layer.shadowOffset = CGSize(width: 0, height: 0)
                tabBarItemView.tintColor = UIColor(hex6: 0xFFFFFF)
                tabBarItemView.layoutIfNeeded()
                
                
                switch tab {
                case 0:
                    tabBarItemView.backgroundColor = UIColor(hex6: 0x8C80EB)
                    tabBarItemView.layer.shadowColor = UIColor(hex6: 0x8C80EB).cgColor
                case 1:
                    tabBarItemView.backgroundColor = UIColor(hex6: 0xF2929B)
                    tabBarItemView.layer.shadowColor = UIColor(hex6: 0xF2929B).cgColor
                case 2:
                    tabBarItemView.backgroundColor = UIColor(hex6: 0x6EE2C0)
                    tabBarItemView.layer.shadowColor = UIColor(hex6: 0x6EE2C0).cgColor
                case 3:
                    tabBarItemView.backgroundColor = UIColor(hex6: 0x5CD0F7)
                    tabBarItemView.layer.shadowColor = UIColor(hex6: 0x5CD0F7).cgColor
                default:
                    break
                }
            }
        }

    }
    
    func deactivate(tab: Int) {
        let tabBarItemView = self.subviews[tab]
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.1, delay: 0.0, options: .allowUserInteraction) {
                tabBarItemView.backgroundColor = .clear
                tabBarItemView.tintColor = UIColor(hex6: 0xA9A9A9)
                tabBarItemView.layer.shadowColor = UIColor.clear.cgColor
                tabBarItemView.layoutIfNeeded()
            }
        }
        
    }
    
    // MARK: - Layuot
    
    override func updateConstraints() {
        super.updateConstraints()

        
    }
    
}
