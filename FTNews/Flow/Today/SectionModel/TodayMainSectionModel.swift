//
//  TodayMainSectionModel.swift
//  FTNews
//
//  Created by Andrey Leganov on 14.10.2020.
//  Copyright © 2020 Леганов Андрей. All rights reserved.
//

import IGListKit

class TodayMainSectionModel {
    
}

// MARK: - ListDiffable
extension TodayMainSectionModel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return String(describing: self) as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return true
    }
    
}
