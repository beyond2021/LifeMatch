//
//  CardView.swift
//  LifeMatch
//
//  Created by KEEVIN MITCHELL on 2/4/19.
//  Copyright © 2019 KEEVIN MITCHELL. All rights reserved.
//

import UIKit

class CardView: UIView {
    fileprivate let imageView = UIImageView(image: #imageLiteral(resourceName: "lady5cMatch"))

    override init(frame: CGRect) {
        super.init(frame: frame)
        //custom drawing code
//        backgroundColor = .red
        // add in the imageView
        // rounding the card corner
        layer.cornerRadius = 10
        clipsToBounds = true
        addSubview(imageView)
        imageView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
