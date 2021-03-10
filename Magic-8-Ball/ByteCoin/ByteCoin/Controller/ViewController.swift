
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var PickerView: UIPickerView!
    @IBOutlet weak var CurrentBCPriceLbl: UILabel!
    @IBOutlet weak var CurrencyLbl: UILabel!
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        coinManager.delegate = self
        PickerView.delegate = self
        PickerView.dataSource = self
    }
    
}

//MARK: - PickerViewDelegate

extension ViewController: CoinManagerDelegate {
    func didUpdatePrice(price: String, currency: String) {
        DispatchQueue.main.async {
            print(price)
            self.CurrentBCPriceLbl.text = price
            self.CurrencyLbl.text = currency
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }

}

//MARK: - UIPickerView and DataSource & Delegate

extension ViewController: UIPickerViewDelegate,UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        CurrencyLbl.text = coinManager.currencyArray[row]
        coinManager.GetCurrencyValue(currency: coinManager.currencyArray[row])
    }
    
}
