

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextInput: UITextField!
    @IBOutlet weak var TenBtn: UIButton!
    @IBOutlet weak var twentyBtn: UIButton!
    @IBOutlet weak var zeroBtn: UIButton!
    @IBOutlet weak var splitNumberLbl: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextInput.endEditing(true)
        
        zeroBtn.isSelected = false
        TenBtn.isSelected = false
        twentyBtn.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLbl.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    
    @IBAction func calculatePressed(_ sender: Any) {
        let bill = billTextInput.text!
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            finalResult = String(format: "%.2f", result)
        }
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResults" {

            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfPeople
        }
    }

}

