//
//  Meal.swift
//  FoodTracker
//
//  Created by Rajat on 29/07/16.
//  Copyright © 2016 Rajat. All rights reserved.
//

import UIKit

class Meal{
    // MARK: Properties
    var name: String
    var photo: UIImage
    var rating: Int
    
    // MARK: Initializer
    // This is a failable initializer as it can return a nil value after initialization 
    init?(name:String, photo:UIImage?, rating:Int)
    {
        self.name = name
        self.photo = photo!
        self.rating = rating
        //Initialization should fall if the rating is negative or there is no name
        if name.isEmpty || rating < 0
        {
            return nil
        }
    }
}
