//
//  Query.swift
//  QuizGame
//
//  Created by MyMacBook on 09.01.2023.
//

import Foundation

public enum Query<T: Hashable>: Hashable {
  case singleAnswer(T)
  case multipleAnswer(T)
}
