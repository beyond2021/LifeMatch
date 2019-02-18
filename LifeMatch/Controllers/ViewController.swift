//
//  ViewController.swift
//  LifeMatch
//
//  Created by KEEVIN MITCHELL on 2/1/19.
//  Copyright © 2019 KEEVIN MITCHELL. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
     let topStackView = TopNavigationStackView() // refactoring make it an instance property instead
     let cardDeckView = UIView()
     let buttonsStackView = HomeBottomControlsStackView() //
    
    //MVC
//    let users = [User(name: "kelly", age: 18, profession: "Teacher", bloodType: "A-", imageName: "lady5cMatch"), User(name: "Jane", age: 23, profession: "Stripper", bloodType: "O", imageName: "lady4c")]

    //MVVM - to support mulitple different looking cards
    let cardViewModels = [
        User(name: "kelly", age: 18, profession: "Teacher", bloodType: "A-", imageName: "lady5cMatch").toCardViewModel(), User(name: "Jane", age: 23, profession: "Stripper", bloodType: "O", imageName: "lady4c").toCardViewModel()// from USER
    ]
    
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
        // fix the stackView arrangement
        // each view has a z index assigned to it.
        overallStackView.bringSubviewToFront(cardDeckView)
    }
//MVC
    /*
    fileprivate func setupDummyCards(){
        print("Setting up some dummy cards")
        //1: declare a container to hold all the cards
        users.forEach { (user) in
            let cardView = CardView(frame: .zero) // same as CardView()
            cardView.imageView.image = UIImage(named: user.imageName)
            // Styling
            let attributedText = NSMutableAttributedString(string: user.name, attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy)])
            // age
            attributedText.append(NSAttributedString(string: "  \(user.age)", attributes:  [.font: UIFont.systemFont(ofSize: 24, weight: .regular)]))
            //
            // age
            attributedText.append(NSAttributedString(string: "  \(user.bloodType)", attributes:  [.font: UIFont.systemFont(ofSize: 24, weight: .regular)]))
            // age
            attributedText.append(NSAttributedString(string: "\n  \(user.profession)", attributes:  [.font: UIFont.systemFont(ofSize: 20, weight: .regular)]))
            
//            cardView.informationLabel.text = "\(user.name) \(user.age) \(user.bloodType) \n \(user.profession)"
            cardView.informationLabel.attributedText = attributedText
            cardDeckView.addSubview(cardView)
            cardView.fillSuperview()
        }
        
        
    }
 */
    //MVVM
    fileprivate func setupDummyCards(){
        cardViewModels.forEach { (viewModel) in
            let cardView = CardView(frame: .zero)
            cardView.imageView.image = UIImage(named: viewModel.imageName) // plug in any image
            cardView.informationLabel.attributedText = viewModel.attributedString // plug your string here.
            cardView.informationLabel.textAlignment = viewModel.textAlignment
            cardDeckView.addSubview(cardView)
            cardView.fillSuperview()
        }
        
    }
    

}

