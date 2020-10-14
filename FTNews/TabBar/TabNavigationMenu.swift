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
        backgroundColor = UIColor(hex6: 0xFFFFFF, alpha: 0.7)
        layer.cornerRadius = 16.0
        layer.shadowColor = UIColor(hex6: 0xFFFFFF).cgColor
        layer.shadowOpacity = 0.9
        layer.shadowRadius = 5
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
//        itemTitleLabel.textColor = UIColor(hex6: 0xA9A9A9)
        itemTitleLabel.textAlignment = .center
//        itemTitleLabel.translatesAutoresizingMaskIntoConstraints = false
//        itemTitleLabel.clipsToBounds = true

        itemIconView.image = item.icon.withRenderingMode(.alwaysTemplate)
        itemIconView.contentMode = .scaleAspectFill
//        itemIconView.translatesAutoresizingMaskIntoConstraints = false
//        itemIconView.clipsToBounds = true

        tabBarItemView.layer.backgroundColor = UIColor.clear.cgColor
        tabBarItemView.layer.cornerRadius = 12.0
        tabBarItemView.addSubview(itemIconView)
//        tabBarItemView.addSubview(itemTitleLabel)
//        tabBarItemView.translatesAutoresizingMaskIntoConstraints = false
//        tabBarItemView.clipsToBounds = true

        itemIconView.snp.remakeConstraints { make in
            make.size.equalTo(CGSize(width: 26.0, height: 26.0))
//            make.centerX.equalToSuperview()
//            make.top.equalToSuperview().offset(11.0)
            make.center.equalToSuperview()
        }

//        itemTitleLabel.snp.remakeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(itemIconView.snp.bottom).offset(3.0)
//        }

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
        let tabToActivate = self.subviews[tab]
        
        switch tab {
        case 0:
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.1, delay: 0.0, options: .allowUserInteraction) {
//                    tabBarItemView.backgroundColor = UIColor(hex6: 0x8C80EB)
                    
                    tabToActivate.backgroundColor = UIColor(hex6: 0x8C80EB)
                    tabToActivate.layer.shadowColor = UIColor(hex6: 0x8C80EB).cgColor
                    tabToActivate.layer.shadowOpacity = 0.5
                    tabToActivate.layer.shadowRadius = 5
                    tabToActivate.layer.shadowOffset = CGSize(width: 0, height: 0)
                    tabToActivate.tintColor = UIColor(hex6: 0xFFFFFF)
                    tabToActivate.layoutIfNeeded()
                }
                self.itemTapped?(tab)
            }
            activeItem = tab
        case 1:
            DispatchQueue.main.async {
                UIView.animateKeyframes(withDuration: 0.1, delay: 0.0, options: .allowUserInteraction) {
//                    self.tabBarItemView.backgroundColor = UIColor(hex6: 0xF2929B)
                    
                    tabToActivate.backgroundColor = UIColor(hex6: 0xF2929B)
                    tabToActivate.layer.shadowColor = UIColor(hex6: 0xF2929B).cgColor
                    tabToActivate.layer.shadowOpacity = 0.5
                    tabToActivate.layer.shadowRadius = 5
                    tabToActivate.layer.shadowOffset = CGSize(width: 0, height: 0)
                    tabToActivate.tintColor = UIColor(hex6: 0xFFFFFF)
                    tabToActivate.layoutIfNeeded()
                }
                self.itemTapped?(tab)
            }
            activeItem = tab
        case 2:
            DispatchQueue.main.async {
                UIView.animateKeyframes(withDuration: 0.1, delay: 0.0, options: .allowUserInteraction) {
//                    self.tabBarItemView.backgroundColor = UIColor(hex6: 0x6EE2C0)
                    
                    tabToActivate.backgroundColor = UIColor(hex6: 0x6EE2C0)
                    tabToActivate.layer.shadowColor = UIColor(hex6: 0x6EE2C0).cgColor
                    tabToActivate.layer.shadowOpacity = 0.5
                    tabToActivate.layer.shadowRadius = 5
                    tabToActivate.layer.shadowOffset = CGSize(width: 0, height: 0)
                    tabToActivate.tintColor = UIColor(hex6: 0xFFFFFF)
                    tabToActivate.layoutIfNeeded()
                }
                self.itemTapped?(tab)
            }
            activeItem = tab
        case 3:
            DispatchQueue.main.async {
                UIView.animateKeyframes(withDuration: 0.1, delay: 0.0, options: .allowUserInteraction) {
//                    self.tabBarItemView.backgroundColor = UIColor(hex6: 0x5CD0F7)
                    
                    tabToActivate.backgroundColor = UIColor(hex6: 0x5CD0F7)
                    tabToActivate.layer.shadowColor = UIColor(hex6: 0x5CD0F7).cgColor
                    tabToActivate.layer.shadowOpacity = 0.5
                    tabToActivate.layer.shadowRadius = 5
                    tabToActivate.layer.shadowOffset = CGSize(width: 0, height: 0)
                    tabToActivate.tintColor = UIColor(hex6: 0xFFFFFF)
                    tabToActivate.layoutIfNeeded()
                }
                self.itemTapped?(tab)
            }
            activeItem = tab
        default:
            break
        }
        
    }
    
    func deactivate(tab: Int) {
        let tabToInactive = self.subviews[tab]
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.1, delay: 0.0, options: .allowUserInteraction) {
                tabToInactive.backgroundColor = .clear
                tabToInactive.tintColor = UIColor(hex6: 0xA9A9A9)
                tabToInactive.layer.shadowColor = UIColor.clear.cgColor
                tabToInactive.layoutIfNeeded()
            }
        }
        
    }
    
    // MARK: - Layuot
    
    override func updateConstraints() {
        super.updateConstraints()

//        searchItemView.snp.remakeConstraints { make in
//            make.size.equalTo(CGSize(width: 62.0, height: 58.0))
//            make.centerY.equalToSuperview()
//            make.leading.equalToSuperview().offset(7.0)
//        }
//
//        todayItemView.snp.remakeConstraints { make in
//            make.size.equalTo(CGSize(width: 62.0, height: 58.0))
//            make.centerY.equalToSuperview()
//            make.leading.equalTo(searchItemView.snp.trailing).offset(7.0)
//        }
//
//        myFTItemView.snp.remakeConstraints { make in
//            make.size.equalTo(CGSize(width: 62.0, height: 58.0))
//            make.centerY.equalToSuperview()
//            make.leading.equalTo(todayItemView.snp.trailing).offset(7.0)
//        }
//
//        menuItemView.snp.remakeConstraints { make in
//            make.size.equalTo(CGSize(width: 62.0, height: 58.0))
//            make.centerY.equalToSuperview()
//            make.leading.equalTo(myFTItemView.snp.trailing).offset(7.0)
//            make.trailing.equalToSuperview().inset(7.0)
//        }
        
    }
    
}
