//
//  SignUpViewController.swift
//  SnufySwift
//
//  Created by Rushabh on 15/10/24.
//

import UIKit

protocol SignUpViewControllerDelegate: AnyObject {
    func didSignUp(username: String, password: String)
}

class SignUpViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    weak var delegate: SignUpViewControllerDelegate?
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        guard let username = usernameTextField.text,
              let password = passwordTextField.text,
              let confirmPassword = confirmPasswordTextField.text else {
            return
        }
        
        if username.isEmpty || password.isEmpty || confirmPassword.isEmpty {
            showAlert(title: "Error", message: "All fields must be filled")
            return
        }
        
        if password != confirmPassword {
            showAlert(title: "Error", message: "Passwords do not match")
            return
        }
        
        // Pass the data back to LoginViewController
        delegate?.didSignUp(username: username, password: password)
        
        // Go back to login screen
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clearInputButtonTapped(_ sender: UIButton) {
        usernameTextField.text = ""
        passwordTextField.text = ""
        confirmPasswordTextField.text = ""
    }
    
    @IBAction func goToLoginButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
