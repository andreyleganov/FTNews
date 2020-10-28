//
//  MainFirstInfoCell.swift
//  FTNews
//
//  Created by Andrey Leganov on 14.10.2020.
//  Copyright © 2020 Леганов Андрей. All rights reserved.
//

import UIKit

class MainFirstInfoCell: UICollectionViewCell {
    
    // MARK: - View
    
    let topicLabel: UILabel = {
        let label = UILabel()
        label.text = "Global Economy"
        label.font = UIFont.systemFont(ofSize: 11.0, weight: .regular)
        label.textColor = UIColor(hex6: 0x851F38)
        label.textAlignment = .left
        
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "OECD drafts principles for\n$100bn global corporate tax\nrevolution"
        label.font = UIFont.systemFont(ofSize: 26.0, weight: .semibold)
        label.textColor = UIColor(hex6: 0x675F5C)
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Technical blueprint would upend texation of\nUS tech groups but still needs politcal\nagreement"
        label.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        label.textColor = UIColor(hex6: 0x675F5C)
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    // MARK: - CellSize
    
    static func cellSize(width: CGFloat) -> CGSize {
        return CGSize(width: width, height: 240.0)
    }
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(topicLabel)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        
        updateConstraintsIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    override func updateConstraints() {
        super.updateConstraints()
        
        topicLabel.snp.remakeConstraints { make in
            make.leading.equalToSuperview().offset(16.0)
            make.top.equalToSuperview().offset(14.0)
            make.trailing.equalToSuperview().inset(16.0)
        }
        
        titleLabel.snp.remakeConstraints { make in
            make.leading.equalToSuperview().offset(16.0)
            make.top.equalTo(topicLabel.snp.bottom).offset(7.0)
            make.trailing.equalToSuperview().inset(16.0)
        }
        
        subtitleLabel.snp.remakeConstraints { make in
            make.leading.equalToSuperview().offset(16.0)
            make.top.equalTo(titleLabel.snp.bottom).offset(23.0)
            make.trailing.equalToSuperview().inset(16.0)
            make.bottom.equalToSuperview().inset(12.0)
        }
        
    }
    
}

