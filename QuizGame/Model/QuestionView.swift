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
    super.init()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
