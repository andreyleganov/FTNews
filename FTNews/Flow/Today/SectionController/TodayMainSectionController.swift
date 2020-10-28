//
//  TodayMainSectionController.swift
//  FTNews
//
//  Created by Andrey Leganov on 14.10.2020.
//  Copyright © 2020 Леганов Андрей. All rights reserved.
//

import IGListKit

class TodayMainSectionController: ListSectionController {
    
    // MARK: - Vars
    
    var model: TodayMainSectionModel!
    
    // MARK: - Lifecycle
    
    override func didUpdate(to object: Any) {
        model = object as? TodayMainSectionModel
    }
    
    override func numberOfItems() -> Int {
        return 3
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let width = collectionContext?.insetContainerSize.width else {
            return .zero
        }
        
        switch index {
        case 0:
            return MainTitleCell.cellSize(width: width)
            
        case 1:
            return MainImageCell.cellSize(width: width)
        case 2:
            return MainFirstInfoCell.cellSize(width: width)
        default:
            return CGSize(width: width, height: 0.0)
        }
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        switch index {
        case 0:
            return configTitleCell(at: index)
        case 1:
            return configImageCell(at: index)
        case 2:
            return configInfoCell(at: index)
        default:
            return UICollectionViewCell()
        }
    }
    
    private func configTitleCell(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: MainTitleCell.self, for: self, at: index) as! MainTitleCell
        
        return cell
    }
    
    private func configImageCell(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: MainImageCell.self, for: self, at: index) as! MainImageCell
        
        return cell
    }
    
    private func configInfoCell(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: MainFirstInfoCell.self, for: self, at: index) as! MainFirstInfoCell
        
        return cell
    }
}
