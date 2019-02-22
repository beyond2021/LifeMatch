//
//  CardView.swift
//  LifeMatch
//
//  Created by KEEVIN MITCHELL on 2/4/19.
//  Copyright © 2019 KEEVIN MITCHELL. All rights reserved.
//

import UIKit

class CardView: UIView {
    // Setter
    // set the cardView model here instead of in the vc
    var cardViewModel: CardViewModel! {
        didSet {
            imageView.image = UIImage(named: cardViewModel.imageName)
            informationLabel.attributedText = cardViewModel.attributedString // plug your string here.
            informationLabel.textAlignment = cardViewModel.textAlignment
            
        }
    }
    
    
    //Configurations // filePrivate security level of encapsulation
    fileprivate let threshold: CGFloat = 80
    
    // Properties
    fileprivate let imageView = UIImageView(image: #imageLiteral(resourceName: "lady5cMatch"))
    fileprivate let gradientLayer = CAGradientLayer()
    fileprivate let informationLabel = UILabel()

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        
        //card Animation
        // 1:
        let panGester = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        addGestureRecognizer(panGester)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupLayout() {
        layer.cornerRadius = 10
        clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        addSubview(imageView)
        imageView.fillSuperview()
        // add a gradient layer
        setupGradientLayer()
        
        addSubview(informationLabel)
        informationLabel.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 16, right: 16))
        informationLabel.textColor = .white
        informationLabel.numberOfLines = 0
    }
    
    //MARK: Layout
    
    
    
    fileprivate func setupGradientLayer() {
        //How we can draw a gradient with swift.
        //1: access the layer in the view - view,s coreAnimation Layer - for drawing
       
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.5, 1.1]
        // self.frame is .zero - remember initializer
//        gradientLayer.frame = CGRect(x: 0, y: 0, width: 300, height: 400)
        layer.addSublayer(gradientLayer)
    }
    // to get the frame - happens everytime our view draws itself
    override func layoutSubviews() {
        // in here you will know what your frame will be.
        gradientLayer.frame = self.frame
    }
    
    //MARK: Touches
    
    @objc fileprivate func handlePan(gesture: UIPanGestureRecognizer){ 

        switch gesture.state {
        case .began:
            // remove aninimations to stop unpredictablity here.
            superview?.subviews.forEach({ (subView) in
                subView.layer.removeAllAnimations()
            })
        case .changed:
            handleChanged(gesture)
        case .ended:
            handleEnded(gesture)
        default:
            ()
        }
        
        
    }
    fileprivate func handleChanged(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: nil)
        // To get rotation
        // Convert Radian to degrees
//        let degrees:CGFloat = 15
        let degrees:CGFloat = translation.x / 20
        let angle = degrees * .pi / 180
        let rotationalTransformation = CGAffineTransform(rotationAngle: angle)
        self.transform  = rotationalTransformation.translatedBy(x: translation.x, y: translation.y)
    }
    
    fileprivate func handleEnded(_ gesture: UIPanGestureRecognizer) {
        //make the card disappear after acertain threshold.
        let translationDirection: CGFloat = gesture.translation(in: nil).x > 0 ? 1 : -1
        
        let shouldDismissCard = abs(gesture.translation(in: nil).x) > threshold
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
            if shouldDismissCard {
  
                self.frame = CGRect(x: 600 * translationDirection, y: 0, width: self.frame.width, height: self.frame.height)
                
                
            } else {
                // transforming the cardview back to center
                self.transform = .identity
                
            }
            
        }) { (_) in
            //bring the card back to the middle
//            print("Completed animation, lets bring our card back")
             self.transform = .identity
//            self.frame = CGRect(x: 0, y: 0, width: self.superview!.frame.width, height: self.superview!.frame.height) // frame changes alot
            if shouldDismissCard {
                self.removeFromSuperview()
            }
            
        }
    }
    
}
