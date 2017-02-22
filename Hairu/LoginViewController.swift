//
//  LoginViewController.swift
//  Hairu
//
//  Created by Louis Daily III on 2/22/17.
//  Copyright © 2017 Louis Daily III. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Properties
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // Hardcoded properties to validate against what is typed in the email and password text fields respectively
    
    let email:String = "hairu@hairu.com"
    let password:String = "shitsandgiggles"
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    
    // Function that takes in a string argument named message to show an alert on screen with the passed in message.
    
    func showAlert(message:String) {
        let alertController = UIAlertController(title: "Login", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    // Function that doesn't take in any parameters or doesn't return
    
    func checkText() {
        if email == emailTextField.text && password == passwordTextField.text {
            showAlert(message: "It matches!")
        } else {
            showAlert(message: "you're wrong foo!")
        }
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        checkText()
    }
    
    // TextField delegate method to tell text fields what they should do when the return button is pressed.
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            emailTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            // Create function to validate email and password!
            view.endEditing(true)
            checkText()
        }
        
        return true
    }
    
}


