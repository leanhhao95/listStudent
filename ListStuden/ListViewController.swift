//
//  ViewController.swift
//  ListStuden
//
//  Created by thang on 8/14/17.
//  Copyright © 2017 thang. All rights reserved.
//

import UIKit
import os.log

class ListViewController: UIViewController , UITextFieldDelegate {
    
    //MARK:Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        ageTextField.delegate  = self
        phoneTextField.delegate = self
        
         // Set up views if editing an existing Meal.
        if let list = list{
        navigationItem.title = list.name
        nameTextField.text = list.name
        ageTextField.text = list.name
        phoneTextField.text = list.name
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var list : List?
//    
//    //MARK: UITextFieldDelegate
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        //Disable the Save button while editting.
//        saveButton.isEnabled = false
//    }
    
    
    
    //MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
    
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
    }
        let name = nameTextField.text ?? ""
        let age = ageTextField.text ?? ""
        let phone = phoneTextField.text ?? ""
        
        list = List(name: name, age: age, phone: phone)
    }
}

