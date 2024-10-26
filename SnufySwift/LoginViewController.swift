//
//  LoginViewController.swift
//  SnufySwift
//
//  Created by Rushabh on 15/10/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var storedUsername: String?
    var storedPassword: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLoginButtonState()
    }
    
    func updateLoginButtonState() {
        loginButton.isEnabled = (storedUsername != nil && storedPassword != nil)
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let inputUsername = usernameTextField.text, let inputPassword = passwordTextField.text else {
            return
        }
        
        if inputUsername == storedUsername && inputPassword == storedPassword {
            // Successful login, go to welcome screen
            let welcomeVC = storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as! WelcomeViewController
            welcomeVC.username = inputUsername
            welcomeVC.modalPresentationStyle = .fullScreen
            present(welcomeVC, animated: true, completion: nil)
        } else {
            showAlert(title: "Error", message: "Invalid username or password")
        }
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        // Navigate to Sign Up Screen
        let signUpVC = storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpViewController
        signUpVC.delegate = self
        signUpVC.modalPresentationStyle = .fullScreen
        present(signUpVC, animated: true, completion: nil)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

// Delegate to receive signup data
extension LoginViewController: SignUpViewControllerDelegate {
    func didSignUp(username: String, password: String) {
        storedUsername = username
        storedPassword = password
        updateLoginButtonState()
    }
}
