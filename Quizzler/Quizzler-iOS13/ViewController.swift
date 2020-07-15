import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ScoreLbl: UILabel!
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
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
        progressBar.progress = quizbrain.GetProgress()
        ScoreLbl.text = "Score : \(quizbrain.GetSore())" 
        
        trueBtn.backgroundColor = UIColor.clear
        falseBtn.backgroundColor = UIColor.clear
    }
    
}

