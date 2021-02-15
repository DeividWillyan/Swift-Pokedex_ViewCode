//
//  TopRatedCoordinator.swift
//  Pokemon
//
//  Created by Deivid Willyan Rodrigues Fabiano on 13/02/21.
//

import UIKit

protocol TopRatedFlow: class {
    func coordinateToDetail()
}

class TopRatedCoordinator: Coordinator, TopRatedFlow {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let topRatedViewController = TopRatedViewController()
        topRatedViewController.coordinator = self
        
        navigationController?.pushViewController(topRatedViewController, animated: false)
    }
    
    // MARK: - Flow Methods
    func coordinateToDetail() {
//        let topRatedDetailCoordinator = TopRatedDetailCoordinator(navigationController: navigationController!)
//        coordinate(to: topRatedDetailCoordinator)
    }
}
