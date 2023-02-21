//
//  ViewController.swift
//  Text Validation App
//
//  Created by Juliana Nielson on 2/21/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginStatusLabel: UILabel!
    
    let lowerCase = NSCharacterSet.lowercaseLetters
    let upperCase = NSCharacterSet.uppercaseLetters
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        validatePassword()
    }
    
    func validatePassword() {
        let charSet = CharacterSet.init(charactersIn: "@,.!#$%^&*<>?+=-")
        var lowerCaseBool = Bool()
        var upperCaseBool = Bool()
    
        for currentCharacter in passwordField.text!.unicodeScalars {
            if lowerCase.contains(currentCharacter) {
                lowerCaseBool = true
            } else if upperCase.contains(currentCharacter) {
                upperCaseBool = true
            }
        }
        
        guard passwordField.text! != "" else {
            loginStatusLabel.text = "Please enter a password."
            return
        }
        guard passwordField.text!.count >= 8 else {
            loginStatusLabel.text = "Password must contain at least 8 characters."
            return
        }
        guard lowerCaseBool == true && upperCaseBool == true else
        {
            loginStatusLabel.text = "Password must contain both lowercase and an uppercase letter."
            return
        }
        guard passwordField.text!.rangeOfCharacter(from: charSet) != nil else {
            loginStatusLabel.text = "Password must contain a special character. (Ex. @,.!#$%^&*<>?+=-)"
            return
        }
        loginStatusLabel.text = "Login succeeded!"
    }
}

