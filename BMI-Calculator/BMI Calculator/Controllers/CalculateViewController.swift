
import UIKit
import Foundation

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var HeightLbl: UILabel!
    @IBOutlet weak var WeightLbl: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Height(_ sender: UISlider) {
        HeightLbl.text = "\(String(format: "%.2f", sender.value))m"
    }
    
    @IBAction func Weight(_ sender: UISlider) {
        WeightLbl.text = "\(Int(sender.value))Kg"
    }
    
    @IBAction func CalculateBtn(_ sender: UIButton) {
        calculatorBrain.CalculateBMI(height: heightSlider.value, weight: weightSlider.value)
                
        self.performSegue(withIdentifier: "ShowResultScreen", sender : self)
    }
    
    override func prepare(for segue: UIStoryboardSegue , sender : Any? ){
        if segue.identifier == "ShowResultScreen" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.GetBMIValue()
            destinationVC.advice = calculatorBrain.GetAdvice()
            destinationVC.color = calculatorBrain.GetColor()
        }
    }
    
}

