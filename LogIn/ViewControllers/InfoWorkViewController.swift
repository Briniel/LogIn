//
//  InfoWorkViewController.swift
//  LogIn
//
//  Created by Михаил Иванов on 27.08.2021.
//

import UIKit

class InfoWorkViewController: UIViewController {
    @IBOutlet var positionLabel: UILabel!
    @IBOutlet var placeWorkLabel: UILabel!

    var placeWork: String!
    var position: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        placeWorkLabel.text = "Место работы:  \(placeWork ?? "")"
        positionLabel.text = "Должность: \(position ?? "")"
    }
}
