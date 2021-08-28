//
//  InfoViewController.swift
//  LogIn
//
//  Created by Михаил Иванов on 27.08.2021.
//

import UIKit

class InfoViewController: UIViewController {
    @IBOutlet var fullNameAndAge: UILabel!

    var userPer: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        fullNameAndAge.text = """
            \(userPer.person.secondName) \(userPer.person.firstName)
            \(userPer.person.middleName ?? "")
            Возраст: \(userPer.person.age)
        """
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let infoWorkVC = segue.destination as? InfoWorkViewController else {
            return
        }
        infoWorkVC.placeWork = userPer.person.placeOfWork
        infoWorkVC.position = userPer.person.position
    }

    @IBAction func clickWork() {
        performSegue(withIdentifier: "workInfo", sender: nil)
    }
}
