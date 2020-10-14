//
//  MyFTViewController.swift
//  FTNews
//
//  Created by Andrey Leganov on 30.09.2020.
//  Copyright © 2020 Леганов Андрей. All rights reserved.
//

import UIKit

class MyFTViewController: UIViewController {
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor(hex6: 0xFFF1E4)
        let label = UILabel(frame: CGRect.zero)
        label.text = "MyFT View Controller"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.sizeToFit()
        self.view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}
