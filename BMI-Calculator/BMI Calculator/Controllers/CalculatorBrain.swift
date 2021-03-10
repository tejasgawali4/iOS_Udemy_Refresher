import UIKit
import Foundation

struct CalculatorBrain {
    
    var bmi: BMI?
    
    mutating func CalculateBMI(height: Float,weight: Float) {
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: .blue)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "fit as a fiddle", color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        } else{
            bmi = BMI(value: bmiValue, advice: "Eat less pie", color: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1))
        }
        
    }
    
    func GetBMIValue() -> String {
        return String(format: "%0.1f", bmi?.value ?? 0.0)
    }
    
    func GetAdvice() -> String {
        return bmi?.advice ?? "Not Found"
    }
    
    func GetColor() -> UIColor {
        return bmi?.color ?? .blue
    }
}
