//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Rajat on 27/07/16.
//  Copyright © 2016 Rajat. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    let defaultPhoto = UIImage(named: "defaultPhoto")
    
    // MARK: FoodTracker Tests
    // Test to confirm that the Meal initializer returns when no name or a negative value for rating is provided 
    func testMealInitialization()
    {
        //Success case
        let potentialItem = Meal(name:"Newest Meal", photo:defaultPhoto, rating:5)
        XCTAssertNotNil(potentialItem)
        
        //Failiure case
        let noName = Meal(name:"", photo: defaultPhoto, rating:0)
        XCTAssertNil(noName, "Empty name is invalid")
        
        let badRating = Meal(name:"Really Bad Rating", photo:defaultPhoto, rating:-1)
        XCTAssertNil(badRating,"Negative rating are invalid be positive")
    }
    
}
