//
//  WelcomeViewController.swift
//  LogIn
//
//  Created by Михаил Иванов on 24.08.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet var welcomeLabel: UILabel!
    var userPer: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(userPer.person.firstName)!"
    }
}
