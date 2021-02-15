//
//  Colors.swift
//  Pokemon
//
//  Created by Deivid Willyan Rodrigues Fabiano on 13/02/21.
//

import UIKit

func getColorType(type: String) -> UIColor {
    switch type {
    case "Normal":
        return UIColor(rgb: 0xFF8C6E63)
      case "Fire":
        return UIColor(rgb: 0xFFF44335)
      case "Water":
        return UIColor(rgb: 0xFF2396F3)
      case "Grass":
        return UIColor(rgb: 0xFF43A047)
      case "Electric":
        return UIColor(rgb: 0xFFFFB300)
      case "Ice":
        return UIColor(rgb: 0xFF01B8D3)
      case "Fighting":
        return UIColor.orange
      case "Poison":
        return UIColor.purple
      case "Ground":
        return UIColor.link
      case "Flying":
        return UIColor.link
      case "Psychic":
        return UIColor.link
      case "Bug":
        return UIColor.link
      case "Rock":
        return UIColor.gray
      case "Ghost":
        return UIColor.link
      case "Dark":
        return UIColor.link
      case "Dragon":
        return UIColor.link
      case "Steel":
        return UIColor.link
      case "Fairy":
        return UIColor.link
      default:
        return UIColor.gray
    }
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
