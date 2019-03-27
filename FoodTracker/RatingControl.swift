//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Kasia McLellan on 3/26/19.
//  Copyright © 2019 KatherineMclellan. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {

    //MARK: Properties
    private var ratingButtons = [UIButton]()
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setUpButtons()
        }
    }
    
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setUpButtons()
        }
    }
    
    var rating = 0
    
    //MARK: Initalization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButtons()
        
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setUpButtons()
        
    }
    
    //MARK: Button Action
    @objc func ratingButtonTapped(button: UIButton) {
        print("Button Pressed")
    }
    
    //MARK: Private Methods
    private func setUpButtons() {
        // Clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        // Create the button
        for _ in 0..<5 {
            let button = UIButton()
            button.backgroundColor = UIColor.red
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
            button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
            
            // Set up the button action
            button.addTarget(self, action:
                #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            // Add the button to the stack
            addArrangedSubview(button)
            
            //Add the new buttons to the rating buttons array
            ratingButtons.append(button)
        }
        
    }
    
}
