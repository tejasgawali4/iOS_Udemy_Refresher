
import UIKit
import Foundation

class ResultViewController : UIViewController {
    
    @IBOutlet weak var bmiResultLbl: UILabel!
    @IBOutlet weak var AdviceLbl: UILabel!
    @IBOutlet weak var bgColor: UIImageView!
    var bmiValue : String?
    var advice : String?
    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bmiResultLbl.text = bmiValue
        AdviceLbl.text = advice
        bgColor.backgroundColor = color
        
    }
    
    @IBAction func RecalculatedPressed(_ sender: UIButton) {
        self.dismiss(animated : true, completion : nil)
    }
}
