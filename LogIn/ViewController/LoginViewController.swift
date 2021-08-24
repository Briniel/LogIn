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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTF.returnKeyType = .next
        userTF.delegate = self
        passTF.returnKeyType = .done
        passTF.delegate = self
    }
    
    @IBAction func clickLogIn() {
        guard userTF.text == "Till", passTF.text == "Rosenrot" else {
            createAlert(title: "WARNING",
                        message: "You made a mistake in your username or password")
            passTF.text = ""
            return
        }
        performSegue(withIdentifier: "authorization", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {
            return
        }
        
        welcomeVC.welcomeText = "Welcome, \(userTF.text ?? "User")!"
    }
    
    @IBAction func logOut(for segue: UIStoryboardSegue) {
        userTF.text = ""
        passTF.text = ""
    }
    
    @IBAction func clickForgotUser() {
        createAlert(title: "You forgot your username?",
                    message: "Don't worry, your username is Till")
    }
    
    @IBAction func clickForgotPass() {
        createAlert(title: "You forgot your password?",
                    message: "Don't worry, your password is Rosenrot")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let elementID = textField.restorationIdentifier
        switch elementID {
            case "user":
                passTF.becomeFirstResponder()
            default:
                self.view.endEditing(true)
                clickLogIn()
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    private func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let buttonAlert = UIAlertAction(title: "OK",
                                        style: .default) { _ in }
        
        alert.addAction(buttonAlert)
        self.present(alert, animated: true, completion: nil)
    }
}
