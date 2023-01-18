//
//  Question.swift
//  QuizGame
//
//  Created by MyMacBook on 21.03.2022.
//

import Foundation

struct Question {
//: Encodable {
//  // This is the key to the solution: bury the type of value inside a closure
//  let valueEncoder: (Encoder) throws -> Void
//
//  init<T: Encodable>(id: String, value: T) {
//    self.valueEncoder = {
//      var container = $0.container(keyedBy: CodingKeys.self)
//      try container.encode(id, forKey: .id)
//      try container.encode(value, forKey: .value)
//    }
//  }
  
//  init(text: String, answers: [Answer], explanation: String) {
//    self.text = text
//    self.answers = answers
//    self.explanation = explanation
//  }
  
//  enum CodingKeys: String, CodingKey {
//    case id, value
//  }
//
//  func encode(to encoder: Encoder) throws {
//    try valueEncoder(encoder)
//  }
        
  let text: String
  var answers: [Answer]
  let explanation: String
}
