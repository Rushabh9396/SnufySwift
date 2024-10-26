//
//  WelcomeViewController.swift
//  SnufySwift
//
//  Created by Rushabh on 15/10/24.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var username: String?
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let username = username {
            welcomeLabel.text = "Welcome, \(username)!"
        }
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
