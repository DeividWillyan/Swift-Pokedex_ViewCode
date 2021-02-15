//
//  PokemonCoordinator.swift
//  Pokemon
//
//  Created by Deivid Willyan Rodrigues Fabiano on 13/02/21.
//

protocol StartFlowPokemon: class {
    func coordinatorToPokemonDetailsPage(pokemon: Pokemon)
}

import UIKit

public enum PokeRoute {
    case pokemon
    case pokevc
}

class PokemonCoordinator: Coordinator, StartFlowPokemon {
     
    
    let navigationController: UINavigationController
    let route: PokeRoute
    
    init(navigationController: UINavigationController, route: PokeRoute) {
        self.navigationController = navigationController
        self.route = route
    }
    
    func start() {
        switch self.route {
        case .pokemon:
            let pokemonViewController = PokemonViewController()
            pokemonViewController.coordinator = self
            navigationController.pushViewController(pokemonViewController, animated: true)
            break;
        case .pokevc:
            let pokemonViewController = PokeVC()
            pokemonViewController.coordinator = self
            navigationController.pushViewController(pokemonViewController, animated: true)
        }
    }
    
    func coordinatorToPokemonDetailsPage(pokemon: Pokemon) {
        let pokemonDetalheVC = PokemonDetalheVC()
        pokemonDetalheVC.pokemon = pokemon
        pokemonDetalheVC.coordinator = self
        navigationController.pushViewController(pokemonDetalheVC, animated: true)
    }
    
    
}
