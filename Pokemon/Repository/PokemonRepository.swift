//
//  PokemonRepository.swift
//  Pokemon
//
//  Created by Deivid Willyan Rodrigues Fabiano on 13/02/21.
//

import Foundation


class PokemonRepository {
    
    var pokemons: [Pokemon] = []
    
     private let uri = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json"
     
     func fetch(completionHandler: @escaping ([Pokemon]) -> Void) {
        let url = URL(string: uri )!
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, res, err) in
            if let data = data {
                let result = try! JSONDecoder().decode(Welcome.self, from: data)
                completionHandler(result.pokemon)
            }
       })
       task.resume()
     }
}


