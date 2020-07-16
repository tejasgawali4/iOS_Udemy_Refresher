import Foundation

struct QuizBrain {
    let quiz = [
        Questions(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], c: "Skin"),
        Questions(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], c: "100"),
        Questions(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], c: "Greenwich Mean Time"),
        Questions(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], c: "Chapeau"),
        Questions(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], c: "Watch"),
        Questions(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], c: "Adiós"),
        Questions(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], c: "Orange"),
        Questions(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], c: "Rum"),
        Questions(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], c: "Gorilla"),
        Questions(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], c: "Australia")
    ]
    
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].correctAnswer {
            score += 1
            return true
        }else{
            return false
        }
    }
    
    func GetQuestion() -> String {
        return quiz[questionNumber].question
    }
    
    func GetAnswer(_ i : Int) -> String {
        return quiz[questionNumber].answer[i]
    }
    
    func GetProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count)
    }
    
    func GetSore() -> Int {
        return score
    }
    
    mutating func NextQuestion() {
        if  questionNumber + 1 < quiz.count {
            questionNumber += 1
        }else{
            questionNumber = 0
            score = 0
        }
    }
    
}
