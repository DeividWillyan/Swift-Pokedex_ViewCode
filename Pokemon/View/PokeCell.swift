//
//  PokeCell.swift
//  Pokemon
//
//  Created by Deivid Willyan Rodrigues Fabiano on 13/02/21.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    var pokemon: Pokemon? {
        didSet {
            if let pokemon = self.pokemon {
                backgroundColor = getColorType(type: pokemon.type[0].rawValue)
                pokeName.text = pokemon.name
                pokeImg.kf.setImage(
                    with: URL(string: "https://www.serebii.net/pokemon/art/\(pokemon.num).png"),
                    options: [.cacheOriginalImage],
                    completionHandler: { (_) in   self.setNeedsLayout() }
                )
                self.subviews.forEach { (subview) in
                    if type(of: subview) == PaddingLabel.self {
                        subview.removeFromSuperview()
                    }
                }
                
                for i in 0..<pokemon.type.count {
                    let lbl = PaddingLabel()
                    lbl.text = pokemon.type[i].rawValue
                    lbl.font = UIFont.systemFont(ofSize: 14)
                    lbl.textColor = .white
                    lbl.layer.backgroundColor = UIColor.white.cgColor.copy(alpha: 0.3)
                    lbl.layer.masksToBounds = true
                    lbl.layer.cornerRadius = 8
                    lbl.padding(2, 2, 5, 5)
                    addSubview(lbl)
                    
                    lbl.auto(
                        top: topAnchor,
                        leading: leadingAnchor,
                        trailing: nil,
                        bottom: nil,
                        padding: .init(top: CGFloat(50 + (i * 30)), left: 16, bottom: 0, right: 0)
                    )
                }
            }
        }
    }
    
    let pokeName: UILabel = {
        var pokeName = UILabel()
        pokeName.textColor = .white
        pokeName.font = UIFont.boldSystemFont(ofSize: 20)
        pokeName.layer.shadowColor = UIColor.black.cgColor
        pokeName.layer.shadowRadius = 2.0
        pokeName.layer.shadowOpacity = 0.5
        pokeName.layer.shadowOffset = CGSize(width: 1, height: 1)
        pokeName.layer.masksToBounds = false
        return pokeName
    }()
    let pokeImg: UIImageView = UIImageView()
    
    var pokebola: UIImageView = {
        let pokebola = UIImageView(frame: .zero)
        pokebola.image = UIImage(named: "pokebola")
        pokebola.alpha = 0.3
        pokebola.translatesAutoresizingMaskIntoConstraints = false
        return pokebola
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.removeFromSuperview()
        
        layer.cornerRadius = 20
        clipsToBounds = true
        
        addSubview(pokeName)
        pokeName.auto(
            top: self.topAnchor,
            leading: self.leadingAnchor,
            trailing: nil,
            bottom: nil,
            padding: .init(top: 16, left: 16, bottom: 0, right: 0)
        )
        
        addSubview(pokeImg)
        pokeImg.contentMode = .scaleAspectFit
        pokeImg.auto(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: bottomAnchor,
            padding: .init(top: 65, left: 65, bottom: -5, right: -20)
        )
        
        insertSubview(pokebola, at: 0)
        pokebola.auto(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: bottomAnchor,
            padding: .init(top: 75, left: 75, bottom: 0, right: 0)
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
