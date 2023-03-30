//
//  Result.swift
//  QuizGame
//
//  Created by MyMacBook on 30.03.2023.
//

import Foundation

public struct Result<Question: Hashable, Answer> {
  public let answers: [Question: Answer]
  public let score: Int
}
