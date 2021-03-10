
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressbar: UIProgressView!
    
    @IBOutlet weak var txtLabel: UILabel!
    
    var player : AVAudioPlayer!
    
    let eggTimes = ["Soft": 3,"Medium":4 ,"Hard" : 7]

    var totalTime = 0
    
    var secondsPassed = 0
    
    var timer = Timer()
    
    @IBAction func BtnPressed(_ sender: UIButton) {
        
        timer.invalidate()
        progressbar.progress = 0.0
        secondsPassed = 0
        
        txtLabel.text = sender.currentTitle!
        
        totalTime = eggTimes[sender.currentTitle!]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            print(Float(secondsPassed) / Float(totalTime))
            progressbar.progress = percentageProgress
        } else {
            timer.invalidate()
            txtLabel.text = "DONE!"
            PlayAlaram()
        }
    }
    
    func PlayAlaram(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }

}
