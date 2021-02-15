//
//  AppCoordinator.swift
//  Pokemon
//
//  Created by Deivid Willyan Rodrigues Fabiano on 13/02/21.
//

import UIKit

class AppCoordinator: Coordinator {
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        let pokemonCoordinator = PokemonCoordinator(
            navigationController: navigationController,
            route: PokeRoute.pokevc
        )
        coordinate(to: pokemonCoordinator)
    }
    
}
