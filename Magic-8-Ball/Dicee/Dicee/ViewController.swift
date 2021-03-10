import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dicePlaceHolderOne: UIImageView!
    @IBOutlet weak var dicePlaceHolderTwo: UIImageView!
    
    //Button Click Action
    @IBAction func btnRollPressed(_ sender: UIButton) {
        let diceArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
        dicePlaceHolderOne.image = diceArray[Int.random(in: 0...5)]
        dicePlaceHolderTwo.image = diceArray[Int.random(in: 0...5)]
    }
}

