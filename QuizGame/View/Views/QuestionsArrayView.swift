//
//  QuestionsArrayView.swift
//  QuizGame
//
//  Created by MyMacBook on 06.03.2023.
//

import Foundation
import UIKit

final class QuestionsArrayView: UIView {
  
//  let questions: [Question]
  
  init(questions: [Question]) {
    self.questions = questions
    super.init(frame: CGRect(x: 0, y: 0, width: 30, height: 40 ))
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
