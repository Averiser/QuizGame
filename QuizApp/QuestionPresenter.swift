//
//  QuestionPresenter.swift
//  QuizGame
//
//  Created by MyMacBook on 02.04.2023.
//

import Foundation
  
struct QuestionPresenter {
  let questions: [Question<String>]
  let question: Question<String>
  
  var title: String {
    guard let index = questions.firstIndex(of: question) else { return "" }
      return "Question #\(index + 1)"
  }
}
