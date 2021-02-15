//
//  PokemonDetalheBottomSheetCV.swift
//  Pokemon
//
//  Created by Deivid Willyan Rodrigues Fabiano on 14/02/21.
//

import UIKit

class PokemonDetalheBottomSheetCV: UIViewController {
    
    let pokemon: Pokemon
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        buildLayout()
    }
}

extension PokemonDetalheBottomSheetCV {
    
    func buildLayout() {
        
        let btnAbout: UIButton = {
            let btn: UIButton = UIButton()
            btn.setTitle("About", for: .normal)
            btn.setTitleColor(UIColor.gray, for: .normal)
            btn.titleLabel?.font = .systemFont(ofSize: 13)
            return btn
        }()
        let btnBaseStats: UIButton = {
            let btn: UIButton = UIButton()
            btn.setTitle("Base Stats", for: .normal)
            btn.setTitleColor(UIColor.gray, for: .normal)
            btn.titleLabel?.font = .systemFont(ofSize: 13)
            return btn
        }()
        let btnEvaluation: UIButton = {
            let btn: UIButton = UIButton()
            btn.setTitle("Evaluation", for: .normal)
            btn.setTitleColor(UIColor.black, for: .normal)
            btn.titleLabel?.font = .boldSystemFont(ofSize: 15)
            return btn
        }()
        let btnMoves: UIButton = {
            let btn: UIButton = UIButton()
            btn.setTitle("Moves", for: .normal)
            btn.setTitleColor(UIColor.gray, for: .normal)
            btn.titleLabel?.font = .systemFont(ofSize: 13)
            return btn
        }()
        
        let stackView = UIStackView(arrangedSubviews: [UIView(), btnAbout, btnBaseStats, btnEvaluation, btnMoves, UIView()])
        stackView.distribution = .equalSpacing
        self.view.addSubview(stackView)
        stackView.auto(
            top: self.view.topAnchor,
            leading: self.view.leadingAnchor,
            trailing: self.view.trailingAnchor,
            bottom: nil,
            padding: .init(top: 50, left: 0, bottom: 0, right: 0)
        )
        
        let lineIndicator: UIView = {
            let line = UIView()
            line.tintColor = getColorType(type: pokemon.type[0].rawValue)
            line.layer.borderWidth = 2.5
            line.layer.borderColor = getColorType(type: pokemon.type[0].rawValue).cgColor
            return line
        }()
        self.view.addSubview(lineIndicator)
        lineIndicator.auto(
            top: self.view.topAnchor,
            leading: nil,
            trailing: self.view.trailingAnchor,
            bottom: nil,
            padding: .init(top: 90, left: 0, bottom: 0, right: 115),
            size: CGSize(width: 60, height: 2.5)
        )
        
        
        
        let lblEvolutionChain: UILabel = {
            let lbl = UILabel()
            lbl.text = "Evolution Chain"
            lbl.font = .boldSystemFont(ofSize: 15)
            return lbl
        }()
        self.view.addSubview(lblEvolutionChain)
        lblEvolutionChain.auto(
            top: self.view.topAnchor,
            leading: self.view.leadingAnchor,
            trailing: nil,
            bottom: nil,
            padding: .init(top: 100, left: 40, bottom: 0, right: 0)
        )
        
        if var nextEvolution = self.pokemon.nextEvolution {
            
            nextEvolution.insert(Evolution(num: pokemon.num, name: pokemon.name), at: 0)
            if nextEvolution.count == 3 {
                nextEvolution.insert(nextEvolution[1], at: 2)
            }
            
            
            for i in 0..<nextEvolution.count {
                let pokeImg: UIImageView = {
                    let img: UIImageView = UIImageView()
                    img.kf.setImage(
                        with: URL(string: "https://www.serebii.net/pokemon/art/\(nextEvolution[i].num).png"),
                        options: [.cacheOriginalImage]
                    )
                    return img
                }()
                self.view.addSubview(pokeImg)
                pokeImg.auto(
                    top: self.view.topAnchor,
                    leading: i % 2 == 0 ? self.view.leadingAnchor : nil,
                    trailing: i % 2 == 0 ? nil : self.view.trailingAnchor,
                    bottom: nil,
                    padding: .init(top: i < 2 ? 130 : 250, left: 20, bottom: 0, right: 20),
                    size: CGSize(width: 100, height: 100)
                )
                
                let lblArrow: UILabel = {
                    let lbl = UILabel()
                    lbl.text = "\u{2192}"
                    lbl.font = .systemFont(ofSize: 20)
                    lbl.textColor = .gray
                    return lbl
                }()
                let lblNext: UILabel = {
                    let lbl = UILabel()
                    lbl.text = "Next"
                    lbl.font = .boldSystemFont(ofSize: 16)
                    return lbl
                }()
                let stackView = UIStackView(arrangedSubviews: [lblArrow, lblNext])
                stackView.axis = .vertical
                
                self.view.addSubview(stackView)
                stackView.auto(
                    top: self.view.topAnchor,
                    leading: self.view.leadingAnchor,
                    trailing: self.view.trailingAnchor,
                    bottom: nil,
                    padding: .init(top: i < 2 ? 160 : 280, left: 0, bottom: 0, right: 0)
                )
                stackView.alignment = .center
                
                if(i % 2 == 0) {
                    let line = UIView()
                    line.layer.borderWidth = 0.5
                    line.layer.borderColor = UIColor.gray.cgColor.copy(alpha: 0.3)
                    line.frame.size.width = view.frame.width * 0.85
                    line.frame.size.height = 0.5
                    self.view.addSubview(line)
                    line.center = CGPoint(x: self.view.bounds.midX,  y: self.view.bounds.height * 0.29);
                }
                
            }
        }
        
    }
}
