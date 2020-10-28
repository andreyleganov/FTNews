//
//  TodayView.swift
//  FTNews
//
//  Created by Andrey Leganov on 13.10.2020.
//  Copyright © 2020 Леганов Андрей. All rights reserved.
//

import UIKit

class TodayView: UIView {
    
    //  MARK: - View
    
    let collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = UIColor(hex6: 0xFFF1E4)
        view.alwaysBounceVertical = true
        
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
        
        updateConstraintsIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    override func updateConstraints() {
        super.updateConstraints()
        
        collectionView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
}
