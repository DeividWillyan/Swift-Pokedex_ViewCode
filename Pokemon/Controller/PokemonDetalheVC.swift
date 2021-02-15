//
//  PodemonDetalheVC.swift
//  Pokemon
//
//  Created by Deivid Willyan Rodrigues Fabiano on 13/02/21.
//

import UIKit
import FittedSheets
import Kingfisher

class PokemonDetalheVC: UIViewController {
    var coordinator: StartFlowPokemon?
    var pokemon: Pokemon? {
        didSet {
            if let pokemon = pokemon {
                view.backgroundColor = getColorType(type: pokemon.type[0].rawValue)
                pokemonName.text = pokemon.name
                pokemonNumber.text = "#\(pokemon.num)"
                pokemonImage.kf.setImage(
                    with: URL(string: "https://www.serebii.net/pokemon/art/\(pokemon.num).png"),
                    options: [.cacheOriginalImage]
                )
                generateTypes()
            }
        }
    }
    
    var imageBackgroud: UIImageView = UIImageView()
    var pokemonName: UILabel = UILabel()
    var pokemonNumber: UILabel = UILabel()
    var pokemonImage: UIImageView = UIImageView()
    var lblSeedPokemon: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildLayout()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.isMovingFromParent {
            navigationController?.navigationBar.barTintColor = .white
        }
    }
    
}

extension PokemonDetalheVC {
    
    func buildLayout() {
        
        imageBackgroud.image = UIImage(named: "pokebola")
        imageBackgroud.alpha = 0.3
        imageBackgroud.contentMode = .scaleAspectFit
//        imageBackgroud.transform = imageBackgroud.transform.rotated(by: .pi / 0.12)
        self.view.addSubview(imageBackgroud)
        imageBackgroud.auto(
            top: self.view.topAnchor,
            leading: self.view.leadingAnchor,
            trailing: self.view.trailingAnchor,
            bottom: self.view.bottomAnchor,
            padding: .init(top: -250, left: 45, bottom: 0, right: 45)
        )
        imageBackgroud.rotate()
        
        
        pokemonName.font = UIFont.boldSystemFont(ofSize: 36)
        pokemonName.textColor = .white
        pokemonNumber.font = UIFont.boldSystemFont(ofSize: 16)
        pokemonNumber.textColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [pokemonName, pokemonNumber])
        stackView.distribution = .equalSpacing
        self.view.addSubview(stackView)
        stackView.auto(
            top: self.view.topAnchor,
            leading: self.view.leadingAnchor,
            trailing: self.view.trailingAnchor,
            bottom: nil,
            padding: .init(top: 30, left: 20, bottom: 0, right: 20)
        )
        
        lblSeedPokemon.text = "Seed Pokemon"
        lblSeedPokemon.font = UIFont.boldSystemFont(ofSize: 13)
        lblSeedPokemon.textColor = .white
        lblSeedPokemon.alpha = 0.8
        self.view.addSubview(lblSeedPokemon)
        lblSeedPokemon.auto(
            top: self.view.topAnchor,
            leading: nil,
            trailing: self.view.trailingAnchor,
            bottom: nil,
            padding: .init(top: 80, left: 0, bottom: 0, right: 16)
        )
        
        let sheet = SheetViewController(
            controller:  PokemonDetalheBottomSheetCV(pokemon: self.pokemon!),
            sizes: [.percent(0.55)]
        )
        sheet.allowPullingPastMaxHeight = false
        sheet.allowPullingPastMinHeight = false
        sheet.cornerRadius = 40
        sheet.dismissOnPull = false
        sheet.overlayColor = UIColor.clear
        sheet.animateIn(to: view, in: self)        
        
        self.view.addSubview(pokemonImage)
        pokemonImage.contentMode = .scaleAspectFit
        pokemonImage.auto(
            top: self.view.topAnchor,
            leading: self.view.leadingAnchor,
            trailing: self.view.trailingAnchor,
            bottom: nil,
            padding: .init(top: 0, left: 80, bottom: 0, right: 80)
        )
        
        
    }
    
}

extension PokemonDetalheVC {
    
    func generateTypes() {
        self.view.subviews.forEach { (subview) in
            if type(of: subview) == PaddingLabel.self {
                subview.removeFromSuperview()
            }
        }
        
        for i in 0..<(self.pokemon?.type.count)! {
            let lbl = PaddingLabel()
            lbl.text = pokemon?.type[i].rawValue
            lbl.font = UIFont.systemFont(ofSize: 14)
            lbl.textColor = .white
            lbl.layer.backgroundColor = UIColor.white.cgColor.copy(alpha: 0.3)
            lbl.layer.masksToBounds = true
            lbl.layer.cornerRadius = 8
            lbl.padding(2, 2, 5, 5)
            self.view.addSubview(lbl)
            
            lbl.auto(
                top: self.view.topAnchor,
                leading: self.view.leadingAnchor,
                trailing: nil,
                bottom: nil,
                padding: .init(top: 80, left: 20 + (CGFloat(i) * CGFloat(50)), bottom: 0, right: 0)
            )
        }
    }
    
}
