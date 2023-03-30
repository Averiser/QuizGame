//
//  Router.swift
//  QuizGame
//
//  Created by MyMacBook on 30.03.2023.
//

import Foundation

public protocol Router {
  associatedtype Question: Hashable
  associatedtype Answer
  
  func routeTo(question: Question, answerCallback: @escaping (Answer) -> Void)
  func routeTo(result: Result<Question, Answer>)
}
