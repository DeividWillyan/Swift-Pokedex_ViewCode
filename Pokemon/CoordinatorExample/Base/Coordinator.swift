//
//  Coordinator.swift
//  Pokemon
//
//  Created by Deivid Willyan Rodrigues Fabiano on 13/02/21.
//

import UIKit

protocol Coordinator {
    func start()
    func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
