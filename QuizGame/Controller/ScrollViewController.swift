//
//  ScrollViewController.swift
//  QuizGame
//
//  Created by MyMacBook on 20.11.2022.
//
/*





import UIKit

//class ScrollViewController: UIViewController
class ResultsPresenter {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
    
  typealias Answers = [(question: Question<String>, answer: [String])]
  typealias Scorer = ([[String]], [[String]]) -> Int

  private let userAnswers: Answers
  private let correctAnswers: Answers
  let scorer: Scorer
  
  init(userAnswers: Answer, correctAnswers: Answer, scorer: @escaping Scorer) {
    self.userAnswers = userAnswers
    self.correctAnswers = correctAnswers
    self.scorer = scorer
  }
  
  var title: String {
    return "You got \(score)/\(userAnswers.count) correct"
  }
   
  var presentableAnswers: [PresentableAnswer] {
    return zip(userAnswers, correctAnswers).map { userAnswer, correctAnswer in
      return presentableAnswer(userAnswer.question, userAnswer.answer, correctAnswer.answer)
    }
  }
  
  private var score: Int {
    return scorer(userAnswers.map {$0.answer}, correctAnswers.map {$0.answer})
  }
  
  private func presentableAnswer(_ question: Question, _ userAnswer: [String], _ correctAnswer: [String]) -> PresentableAnswer {
    return PresentableAnswer(
      question: question.text,
      answer: formattedAnswer(correctAnswer),
      wrongAnswer: formattedWrongAnswer(userAnswer, correctAnswer))
  }
  
  private func formattedAnswer(_ answer: [String]) -> String {
    return answer.joined(separator: ", ")
  }
  
  private func formattedWrongAnswer(_ userAnswer: [String], _ correctAnswer: [String]) -> String? {
    return correctAnswer == userAnswer ? nil : formattedAnswer(userAnswer)
  }

}

*/
