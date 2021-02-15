//
//  PokemonViewController.swift
//  Pokemon
//
//  Created by Deivid Willyan Rodrigues Fabiano on 13/02/21.
//


import UIKit
import Kingfisher

class PokemonViewController: UIViewController {
    
    var coordinator: StartFlowPokemon?
    var pokemons: [Pokemon] = []
    
    let tableView: UITableView = UITableView()
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Pokedex"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 34)
        ]
        navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.shadowImage = UIImage() // rmv borda inferior da navigationBar
        
        view.backgroundColor = .white
        
        loadApiData()
        buildLayout()
        
    }
    
}

extension PokemonViewController: UITableViewDelegate, UITableViewDataSource  {
        
    func buildLayout() {
        tableView.frame = self.view.frame
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        self.view.addSubview(tableView)        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let pokemon = pokemons[indexPath.item]
        
        cell.imageView?.kf.setImage(
            with: URL(string: pokemon.img),
            options: [.cacheOriginalImage],
            completionHandler: { (_) in   cell.setNeedsLayout() }
        )
        cell.textLabel?.text = pokemon.name
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        cell.backgroundColor = getColorType(type: pokemon.type[0].rawValue)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(200)
    }
    
}



extension PokemonViewController {
    func loadApiData() {
        PokemonRepository().fetch { [weak self] (pokes: [Pokemon]) in
            self?.pokemons = pokes
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}


