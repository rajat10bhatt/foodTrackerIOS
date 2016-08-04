//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Rajat on 28/07/16.
//  Copyright © 2016 Rajat. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    //MARK: Properties
    // Rating is given a property observer. A property observer observes and responds to property value. Property observers are called every time propertie's value is set and can be used to perform work immediately after and before the value changes. Specifically didSet is called immediately after the property value is set.
    var rating = 0{
        didSet{
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    let spacing = 5
    let starCount = 5

    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        for _ in 0..<starCount
        {
            let button = UIButton()
            
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted,.Selected])
            
            button.adjustsImageWhenHighlighted = false
            
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), forControlEvents: .TouchDown)
            ratingButtons += [button]
            addSubview(button)
        }
    }
    override func layoutSubviews() {
        // Set button height to a square the size of the frame's height
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x:0, y:0, width: buttonSize, height: buttonSize)
        // Ofset each button's origin by length of the button plus spacing
        //The enumerate method returns a collection that contains elements in the ratingButtons paired with their indexes
        for(index, button) in ratingButtons.enumerate(){
            buttonFrame.origin.x = CGFloat(index * (buttonSize+spacing))
            button.frame = buttonFrame
        }
        updateButtonSelectionStates()
    }
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize * starCount) + (spacing*(starCount-1))
        return CGSize(width: width, height: buttonSize)
    }
    
    // MARK: Button Action
    func ratingButtonTapped(button: UIButton)
    {
        rating = ratingButtons.indexOf(button)! + 1
        updateButtonSelectionStates()
        print("\(rating)")
    }
    func updateButtonSelectionStates()
    {
        for(index, button) in ratingButtons.enumerate()
        {
            //If index of the buttonis less then rating then the button should be selected
            button.selected = index < rating
        }
    }
}
