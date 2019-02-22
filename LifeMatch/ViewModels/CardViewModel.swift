//
//  CardViewModel.swift
//  LifeMatch
//
//  Created by KEEVIN MITCHELL on 2/17/19.
//  Copyright © 2019 KEEVIN MITCHELL. All rights reserved.
//

import UIKit
// PROTOCOL ORIENTED PROGRAMMING
protocol ProducesCardViewModel {
    func toCardViewModel() -> CardViewModel
}

struct CardViewModel {
    let imageName: String
    let attributedString: NSAttributedString
    let textAlignment: NSTextAlignment
}
