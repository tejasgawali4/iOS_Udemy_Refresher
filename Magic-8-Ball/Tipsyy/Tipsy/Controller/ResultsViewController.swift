//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by EAG on 7/17/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var settingLbl: UILabel!
    @IBOutlet weak var totalLbl: UILabel!
    var result = "0.0"
    var tip = 10
    var split = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLbl.text = result
        settingLbl.text = "Split between \(split) people, with \(tip)% tip."
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
