//
//  ChoreViewController.swift
//  ChoreApp
//
//  Created by William Wallace on 4/13/19.
//  Copyright © 2019 William Wallace. All rights reserved.
//

import UIKit
import os.log

class ChoreViewController: UIViewController, UITextFieldDelegate,
UINavigationControllerDelegate{
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    var chore: Chore?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = nameTextField.text ?? ""
        
        chore = Chore(name: name)
        
        
        
    }
    
}
