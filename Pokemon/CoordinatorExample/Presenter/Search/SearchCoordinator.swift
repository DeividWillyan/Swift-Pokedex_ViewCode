//
//  SearchCoordinator.swift
//  Pokemon
//
//  Created by Deivid Willyan Rodrigues Fabiano on 13/02/21.
//

import UIKit

protocol SearchFlow: class {
    func coordinateToDetail()
}

class SearchCoordinator: Coordinator, SearchFlow {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let searchViewController = SearchViewController()
        searchViewController.coordinator = self
        
        navigationController?.pushViewController(searchViewController, animated: false)
    }
    
    // MARK: - Flow Methods
    func coordinateToDetail() {
//        let searchDetailCoordinator = SearchDetailCoordinator(navigationController: navigationController!)
//        coordinate(to: searchDetailCoordinator)
    }
    
}
