//
//  Created by MyMacBook on 02.04.2023.
//

import Foundation

struct ResultsPresenter {
  let result: Result<Question<String>, [String]>
  let questions: [Question<String>]
//  let options: Dictionary<Question<String>, [String]>
  let correctAnswers: Dictionary<Question<String>, [String]>
  
  var title: String {
    return "Result"
  }
  
  var summary: String {
    return "You got \(result.score)/\(result.answers.count) correct."
  }
  
  var presentableAnswers: [PresentableAnswer] {
    return questions.map { question in
      
      guard let userAnswer = result.answers[question],
            let correctAnswer = correctAnswers[question] else {
        fatalError("Could not find correct answer for question: \(question)")
      }
      return presentableAnswer(question, userAnswer, correctAnswer)
    }
  }
  
  private func presentableAnswer(_ question: Question<String>, _ userAnswer: [String], _ correctAnswer: [String]) -> PresentableAnswer {
    switch question {
    case .singleAnswer(let value), .multipleAnswer(let value):
      return PresentableAnswer(question: value,
                               answer: formattedAnswer(correctAnswer),
                               wrongAnswer: formattedWrongAnswer(userAnswer, correctAnswer))
    }
  }
  
//  private func ordered(_ answers: Set<String>) -> [String] {
//    return options.filter { answers.contains($0) }
//  }
  
  private func formattedAnswer(_ answer: [String]) -> String   {
    return answer.joined(separator: ", ")
  }
  
  private func formattedWrongAnswer(_ userAnswer: [String], _ correctAnswer: [String]) -> String? {
    return correctAnswer == userAnswer ? nil : formattedAnswer(userAnswer)
  }
}
