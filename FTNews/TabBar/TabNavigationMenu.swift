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
        let tabToActivate = self.subviews[tab]
        
        switch tab {
        case 0:
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.1, delay: 0.0, options: .allowUserInteraction) {
                    
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

        
    }
    
}
