//
//  HomeBottomControlsStackView.swift
//  LifeMatch
//
//  Created by KEEVIN MITCHELL on 2/2/19.
//  Copyright © 2019 KEEVIN MITCHELL. All rights reserved.
//

import UIKit

class HomeBottomControlsStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        distribution = .fillEqually
        heightAnchor.constraint(equalToConstant: 100).isActive = true
//        let button = UIButton(type: .system)
        let yellowSubViews = [#imageLiteral(resourceName: "refresh_circle"), #imageLiteral(resourceName: "dismiss_circle"), #imageLiteral(resourceName: "super_like_circle"), #imageLiteral(resourceName: "like_circle"), #imageLiteral(resourceName: "boost_circle")].map { (image) -> UIButton in
            let b = UIButton(type: .system)
            b.setImage(image, for: .normal)
            return b
        }
        
        yellowSubViews.forEach { (v) in
            addArrangedSubview(v) // does it one at at time use for each loop
        }
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
