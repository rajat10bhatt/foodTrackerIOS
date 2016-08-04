//
//  ViewController.swift
//  FoodTracker
//
//  Created by Rajat on 27/07/16.
//  Copyright © 2016 Rajat. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    // MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    /*
     This value is either passed by MealTableViewController in
     'prepareForSegue(_:sender:)'
      or constructed as part of adding a new meal
     */
    var meal:Meal?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameTextField.delegate = self
        //Enable the save button only if the text field has a valid meal name
        checkValidMealName()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegates
    //First meathod to be called in UITextFieldDelegate
    func textFieldDidBeginEditing(textField: UITextField) {
        //Disable save button while Editing
        saveButton.enabled = false
    }
    func checkValidMealName()
    {
        //Disable the save button if text field is empty
        let text = nameTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //Hide the keyboard
        nameTextField.resignFirstResponder()
        return true
    }
    
    //Method called after textFieldShouldReturn
    
    func textFieldDidEndEditing(textField: UITextField) {
        checkValidMealName()
        mealNameLabel.text = nameTextField.text
        
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // Dismiss the picker if user cancelled
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // The info dictionary contains multiple representations of the image, and this uses the original
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        //Set photo view to selectedImage
        photoImageView.image = selectedImage
        //Dismiss  the picker
        dismissViewControllerAnimated(true, completion: nil)
    }
    // MARK: Navigation
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    //This meathod lets you configure a view controller before its prepared
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender
        {
            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            let rating = ratingControl.rating
            //Set the meal to be passed to MealTableViewController after the unwind segue 
            meal = Meal(name: name, photo: photo, rating: rating)
            
        }
    }
    
    // MARK: Actions
    
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        // Hide the keyboard
        nameTextField.resignFirstResponder()
        // UIImagePickerController is a view controller that lets a user pick media from photo library
        let imagePickerController = UIImagePickerController()
        // Only allows photo to be picked not taken
        imagePickerController.sourceType = .PhotoLibrary
        // make sure viewcontroller is notified when user pics an image
        imagePickerController.delegate = self
        presentViewController(imagePickerController, animated: true, completion: nil)
    }

}

