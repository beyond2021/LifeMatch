//
//  User.swift
//  LifeMatch
//
//  Created by KEEVIN MITCHELL on 2/16/19.
//  Copyright © 2019 KEEVIN MITCHELL. All rights reserved.
//

import Foundation
import UIKit

struct User {
    let name: String
    let age: Int
    let profession: String
    let bloodType: String
    let imageName: String
    
    //To create a cardViewModel MVVM
    func toCardViewModel() -> CardViewModel {
        let attributedText = NSMutableAttributedString(string: name, attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy)])
        // age
        attributedText.append(NSAttributedString(string: "  \(age)", attributes:  [.font: UIFont.systemFont(ofSize: 24, weight: .regular)]))
        //
        // age
        attributedText.append(NSAttributedString(string: "  \(bloodType)", attributes:  [.font: UIFont.systemFont(ofSize: 24, weight: .regular)]))
        // age
        attributedText.append(NSAttributedString(string: "\n  \(profession)", attributes:  [.font: UIFont.systemFont(ofSize: 20, weight: .regular)]))
        return CardViewModel(imageName: imageName, attributedString: attributedText, textAlignment: .left)
    }
}
