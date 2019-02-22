//
//  Advertiser.swift
//  LifeMatch
//
//  Created by KEEVIN MITCHELL on 2/18/19.
//  Copyright © 2019 KEEVIN MITCHELL. All rights reserved.
//

import Foundation
import UIKit
struct Advertiser: ProducesCardViewModel {
    let title: String
    let brandName: String
    let posterPhotoName: String
    // way to transform me into a cardViewModel
    //To create a cardViewModel MVVM
    func toCardViewModel() -> CardViewModel {
        //Title
        let attributedText = NSMutableAttributedString(string: title, attributes: [.font: UIFont.systemFont(ofSize: 34, weight: .heavy)])
       
        // Brand Name
        attributedText.append(NSAttributedString(string: "\n" + brandName, attributes:  [.font: UIFont.systemFont(ofSize: 20, weight: .regular)]))
        return CardViewModel(imageName: posterPhotoName, attributedString: attributedText, textAlignment: .center)
    }
}
