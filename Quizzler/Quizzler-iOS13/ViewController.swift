import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ScoreLbl: UILabel!
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizbrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerBtnPressed(_ sender: UIButton) {
  
        if quizbrain.checkAnswer(sender.currentTitle!) {
            sender.backgroundColor = UIColor.green
        }
        else {
            sender.backgroundColor = UIColor.red
        }
        
        quizbrain.NextQuestion()
    }
    
    @objc func updateUI(){
        Timer.scheduledTimer(timeInterval: 0.2, target: self,selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        questionLbl.text = quizbrain.GetQuestion()
        
        option1.setTitle(quizbrain.GetAnswer(0), for: .normal)
        option2.setTitle(quizbrain.GetAnswer(1), for: .normal)
        option3.setTitle(quizbrain.GetAnswer(2), for: .normal)

        progressBar.progress = quizbrain.GetProgress()
        ScoreLbl.text = "Score : \(quizbrain.GetSore())" 
        
        option1.backgroundColor = UIColor.clear
        option2.backgroundColor = UIColor.clear
        option3.backgroundColor = UIColor.clear

    }
    
}

