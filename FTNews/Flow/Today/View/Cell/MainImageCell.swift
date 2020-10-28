//
//  MainImageCell.swift
//  FTNews
//
//  Created by Andrey Leganov on 14.10.2020.
//  Copyright © 2020 Леганов Андрей. All rights reserved.
//

import UIKit

class MainImageCell: UICollectionViewCell {
    
    // MARK: - View
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "today_image")
        view.contentMode = .scaleAspectFill
        
        return view
    }()
    
    // MARK: - CellSize
    
    static func cellSize(width: CGFloat) -> CGSize {
        return CGSize(width: width, height: 212.0)
    }
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        
        updateConstraintsIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    override func updateConstraints() {
        super.updateConstraints()
        
        imageView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
}

