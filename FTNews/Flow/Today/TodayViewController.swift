//
//  TodayViewController.swift
//  FTNews
//
//  Created by Andrey Leganov on 30.09.2020.
//  Copyright © 2020 Леганов Андрей. All rights reserved.
//

import UIKit
import IGListKit

class TodayViewController: UIViewController {
    
    // MARK: - Vars
    
    private var mainView: TodayView! {
        return view as? TodayView
    }
    
    private lazy var adapter: ListAdapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = TodayView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adapter.collectionView = mainView.collectionView
        adapter.dataSource = self
        
    }
    
}

// MARK: - ListAdapterDataSource
extension TodayViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        var objects = [ListDiffable]()
        objects.append(TodayMainSectionModel())
        
        return objects
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is TodayMainSectionModel:
            return TodayMainSectionController()
        default:
            return ListSectionController()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        nil
    }
    
}
