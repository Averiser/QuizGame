//
//  Question.swift
//  QuizGame
//
//  Created by MyMacBook on 21.03.2022.
//

import Foundation

struct Question  /* <T: Hashable>: Hashable */ {
//  static func == (lhs: Question<T>, rhs: Question<T>) -> Bool {
//    let areEqual = lhs.text == rhs.text && lhs.answers == rhs.answers
//    return areEqual
//  }
  
//  public func hash(into hasher: inout Hasher) {
//    hasher.combine(0)
//  }
  
        
  let text: String
  var answers: [Answer]
  let explanation: String
}
