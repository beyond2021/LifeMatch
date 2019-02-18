//
//  CardView.swift
//  LifeMatch
//
//  Created by KEEVIN MITCHELL on 2/4/19.
//  Copyright © 2019 KEEVIN MITCHELL. All rights reserved.
//

import UIKit

class CardView: UIView {
    //Configurations
    fileprivate let threshold: CGFloat = 80
    let imageView = UIImageView(image: #imageLiteral(resourceName: "lady5cMatch"))
    let informationLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 10
        clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        addSubview(imageView)
        imageView.fillSuperview()
        addSubview(informationLabel)
        informationLabel.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 16, right: 16))
        informationLabel.text = "TEST NAME TEST AGE TEST BLOODTYPE"
        informationLabel.textColor = .white
        informationLabel.font = UIFont.systemFont(ofSize: 34, weight: .heavy)
        informationLabel.numberOfLines = 0
        
        //card Animation
        // 1:
        let panGester = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        addGestureRecognizer(panGester)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    @objc fileprivate func handlePan(gesture: UIPanGestureRecognizer){

        switch gesture.state {
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
