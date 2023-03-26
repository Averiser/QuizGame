//
//  QuestionView.swift
//  QuizGame
//
//  Created by MyMacBook on 21.04.2022.
//

import Foundation
import UIKit

class QuestionView: UIView {
  
  let question: Question
  
  init(question: Question) {
    self.question = question
    super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public var questions: [Question] = [] {
    didSet {
      print(questions)
    }
  }
  
}