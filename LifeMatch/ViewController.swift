//
//  ViewController.swift
//  LifeMatch
//
//  Created by KEEVIN MITCHELL on 2/1/19.
//  Copyright © 2019 KEEVIN MITCHELL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     let topStackView = TopNavigationStackView() // refactoring make it an instance property instead
     let cardDeckView = UIView()
     let buttonsStackView = HomeBottomControlsStackView() //

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        cardDeckView.backgroundColor = .blue
        setupLayout()
        setupDummyCards()
        
    }
    
    // MARK:- filePrivate
    
    //overall stackView
    fileprivate func setupLayout() {
        let overallStackView = UIStackView(arrangedSubviews: [topStackView, cardDeckView, buttonsStackView])
        overallStackView.axis =  .vertical
        view.addSubview(overallStackView)
        // This enables autoLayout
        overallStackView.translatesAutoresizingMaskIntoConstraints = false
        overallStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        //getting the white border at the side of the imageView
        overallStackView.isLayoutMarginsRelativeArrangement = true
        overallStackView.layoutMargins = .init(top: 0, left: 12, bottom: 0, right: 12)
    }

    fileprivate func setupDummyCards(){
        print("Setting up some dummy cards")
        //1: declare a container to hold all the cards
        let cardView = CardView(frame: .zero) // same as CardView()
        //2: add it to the view
        cardDeckView.addSubview(cardView)
        cardView.fillSuperview()
    }

}

