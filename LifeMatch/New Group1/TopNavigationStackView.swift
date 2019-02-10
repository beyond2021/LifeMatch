//
//  TopStackView.swift
//  LifeMatch
//
//  Created by KEEVIN MITCHELL on 2/3/19.
//  Copyright © 2019 KEEVIN MITCHELL. All rights reserved.
//  // refactoring for ViewDidLoad by subClassing UIStackView

import UIKit

class TopNavigationStackView: UIStackView {
    let settingButton = UIButton(type: .system)
    let messageButton = UIButton(type: .system)
    let kidneyImageView = UIImageView(image: #imageLiteral(resourceName: "kidneyIcon"))

    override init(frame: CGRect) {
        super.init(frame: frame)
        distribution = .fillEqually
        heightAnchor.constraint(equalToConstant: 100).isActive = true
        // views

        //special Customizations
        settingButton.setImage(#imageLiteral(resourceName: "top_left_profile").withRenderingMode(.alwaysOriginal), for: .normal)
        messageButton.setImage(#imageLiteral(resourceName: "top_right_messages").withRenderingMode(.alwaysOriginal), for: .normal)
        //set an array for the top views
        [settingButton,kidneyImageView,messageButton].forEach { (v) in
            addArrangedSubview(v) // method on uistackview
        }
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
