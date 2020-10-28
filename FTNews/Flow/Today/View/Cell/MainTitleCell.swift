//
//  MainTitleCell.swift
//  FTNews
//
//  Created by Andrey Leganov on 14.10.2020.
//  Copyright © 2020 Леганов Андрей. All rights reserved.
//

import UIKit

class MainTitleCell: UICollectionViewCell {
    
    // MARK: - View
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "FINANCIAL TIMES"
        label.font = UIFont.systemFont(ofSize: 30.0, weight: .bold)
        label.textColor = UIColor(hex6: 0x221D23)
        label.textAlignment = .center
        
        return label
    }()
    
    let updateLabel: UILabel = {
        let label = UILabel()
        label.text = "Updated 5:42 pm"
        label.font = UIFont.systemFont(ofSize: 11.0, weight: .semibold)
        label.textColor = UIColor(hex6: 0x221D23, alpha: 0.8)
        label.textAlignment = .center
        
        return label
    }()
    
    // MARK: - CellSize
    
    static func cellSize(width: CGFloat) -> CGSize {
        return CGSize(width: width, height: 60.0)
    }
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        addSubview(updateLabel)
        
        updateConstraintsIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    override func updateConstraints() {
        super.updateConstraints()
        
        titleLabel.snp.remakeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(6.0)
        }
        
        updateLabel.snp.remakeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom)
        }
        
    }
    
}
