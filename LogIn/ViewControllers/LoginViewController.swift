//
//  LoginViewController.swift
//  LogIn
//
//  Created by Михаил Иванов on 24.08.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var userTF: UITextField!
    @IBOutlet var passTF: UITextField!
    
    var userPer: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTF.returnKeyType = .next
        userTF.delegate = self
        passTF.returnKeyType = .done
        passTF.delegate = self
        
        userPer = User.getUser()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else {
            return
        }
        guard let viewControllers = tabBarController.viewControllers else {
            return
        }
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.userPer = userPer
            } else if let navigationVC = viewController as? UINavigationController {
                let infoVC = navigationVC.topViewController as? InfoViewController
                infoVC?.userPer = userPer
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func clickLogIn() {
        guard userTF.text == userPer.username, passTF.text == userPer.password else {
            showAlert(title: "WARNING",
                      message: "You made a mistake in your username or password")
            passTF.text = ""
            return
        }
    }
    
    @IBAction func clickForgotUser() {
        showAlert(title: "You forgot you're username?",
                  message: "Don't worry, your username is \(userPer.username)")
    }
    
    @IBAction func clickForgotPass() {
        showAlert(title: "You forgot your password?",
                  message: "Don't worry, your password is \(userPer.password)")
    }
    
    @IBAction func logOut(for segue: UIStoryboardSegue) {
        userTF.text = ""
        passTF.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userTF {
            passTF.becomeFirstResponder()
        } else {
            clickLogIn()
            performSegue(withIdentifier: "authorization", sender: nil)
        }
        return true
    }
}

extension LoginViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let buttonAlert = UIAlertAction(title: "OK",
                                        style: .default) { _ in }
        
        alert.addAction(buttonAlert)
        present(alert, animated: true)
    }
}
