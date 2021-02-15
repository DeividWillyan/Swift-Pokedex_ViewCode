//
//  PokemonVC.swift
//  Pokemon
//
//  Created by Deivid Willyan Rodrigues Fabiano on 13/02/21.
//

import UIKit

class PokeVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var coordinator: StartFlowPokemon?
    var pokemons: [Pokemon] = []
    let cellId = "cellId"
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Pokedex"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 26)
        ]
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        let btn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.compose, target: self, action: nil)
        navigationItem.rightBarButtonItem = btn
        
        collectionView.backgroundColor = .white
        collectionView.register(PokeCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.contentInset = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
        
      
        
        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
            layout.minimumLineSpacing = 10
            layout.minimumInteritemSpacing = 10
            layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            let size = CGSize(width:(collectionView!.bounds.width-30)/2, height: 180)
            layout.itemSize = size
        }
        
        loadApiData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pokemons.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PokeCell
        
        cell.pokemon = self.pokemons[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem()
        navigationController?.navigationBar.topItem?.backBarButtonItem?.tintColor = .white
        navigationController?.navigationBar.barTintColor = getColorType(type: self.pokemons[indexPath.item].type[0].rawValue)
        coordinator?.coordinatorToPokemonDetailsPage(pokemon: self.pokemons[indexPath.item])
    }
    
   
   
}

extension PokeVC {
    func loadApiData() {
        PokemonRepository().fetch { [weak self] (pokes: [Pokemon]) in
            self?.pokemons = pokes
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
}
