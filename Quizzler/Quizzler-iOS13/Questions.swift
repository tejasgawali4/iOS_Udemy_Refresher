import Foundation

struct Questions {
    let question : String
    let answer : [String]
    let correctAnswer : String
    
    init(q: String, a:[String], c:String) {
        question = q
        answer = a
        correctAnswer = c
    }
}
