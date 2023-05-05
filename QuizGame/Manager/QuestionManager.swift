//
//  QuestionManager.swift
//  QuizGame
//
//  Created by MyMacBook on 26.04.2022.
//

import Foundation

class QuestionManager {
  enum LevelType: String {
    case beginners = "Beginners"
    case middle = "Middle"
    case advanced = "Advanced"
  }
  
  // MARK: - Properties
  
  private (set) var questions: [Question] = []
  private (set) var answers: [Answer] = []
  /*private (set)*/ var currentQuestion: Question?
  private (set) var questionNumber: Int = 0
  public var levelType: LevelType = .beginners
  
  // MARK: - Constants
  
  public let defaultQuestions: [LevelType: [Question]] = [
    .beginners: [
      Question(text: "What is 2 + 2?", answers: [
        Answer(text: "1", correct: false),
        Answer(text: "2", correct: false),
        Answer(text: "4", correct: true),
        Answer(text: "7", correct: false)
      ], explanation: "The correct answer will be ___ as it is a Singular form."),
      Question(text: "What is 2 + 10?", answers: [
        Answer(text: "1", correct: false),
        Answer(text: "12", correct: true),
        Answer(text: "4", correct: false),
        Answer(text: "7", correct: false)
      ], explanation: "The correct answer will be is as it is a Singular form."),
      Question(text: "What is 7 - 1?", answers: [
        Answer(text: "1", correct: false),
        Answer(text: "0", correct: false),
        Answer(text: "6", correct: true),
        Answer(text: "3", correct: false)
      ], explanation: "The correct answer will be is as it is a Singular form."),
      Question(text: "What is 100 + 50?", answers: [
        Answer(text: "3", correct: false),
        Answer(text: "12", correct: false),
        Answer(text: "150", correct: true),
        Answer(text: "70", correct: false)
      ], explanation: "The correct answer will be is as it is a Singular form."),
      Question(text: "What is 15 + (-5)?", answers: [
        Answer(text: "3", correct: false),
        Answer(text: "12", correct: false),
        Answer(text: "110", correct: false),
        Answer(text: "10", correct: true)
      ], explanation: "The correct answer will be is as it is a Singular form."),
      Question(text: "What is 2 + 0?", answers: [
        Answer(text: "1", correct: false),
        Answer(text: "5", correct: false),
        Answer(text: "4", correct: false),
        Answer(text: "2", correct: true)
      ], explanation: "The correct answer will be is as it is a Singular form.")
    ],
    .middle: [
      Question(text: "What is 2 * 2?", answers: [
        Answer(text: "1", correct: false),
        Answer(text: "2", correct: false),
        Answer(text: "4", correct: true),
        Answer(text: "7", correct: false)
      ], explanation: "The correct answer will be is as it is a Singular form."),
      Question(text: "What is 2 * 10?", answers: [
        Answer(text: "1", correct: false),
        Answer(text: "12", correct: false),
        Answer(text: "20", correct: true),
        Answer(text: "7", correct: false)
      ], explanation: "The correct answer will be is as it is a Singular form."),
      Question(text: "What is 3 * 3?", answers: [
        Answer(text: "1", correct: false),
        Answer(text: "2", correct: false),
        Answer(text: "9", correct: true),
        Answer(text: "19", correct: false)
      ], explanation: "The correct answer will be is as it is a Singular form."),
      Question(text: "What is 4 * 4?", answers: [
        Answer(text: "16", correct: true),
        Answer(text: "8", correct: false),
        Answer(text: "20", correct: false),
        Answer(text: "28", correct: false)
      ], explanation: "The correct answer will be is as it is a Singular form."),
      Question(text: "What is 5 * 5?", answers: [
        Answer(text: "6", correct: false),
        Answer(text: "25", correct: true),
        Answer(text: "14", correct: false),
        Answer(text: "7", correct: false)
      ], explanation: "The correct answer will be is as it is a Singular form.")
    ],
    .advanced: [
      Question(text: "What is 2 / 2?", answers: [
        Answer(text: "1", correct: true),
        Answer(text: "2", correct: false),
        Answer(text: "4", correct: false),
        Answer(text: "7", correct: false)
      ], explanation: "The correct answer will be is as it is a Singular form."),
      Question(text: "What is 10 / 2?", answers: [
        Answer(text: "1", correct: false),
        Answer(text: "12", correct: false),
        Answer(text: "4", correct: false),
        Answer(text: "5", correct: true)
      ], explanation: "The correct answer will be is as it is a Singular form."),
      Question(text: "What is 27 / 3?", answers: [
        Answer(text: "10", correct: false),
        Answer(text: "9", correct: true),
        Answer(text: "11", correct: false),
        Answer(text: "12", correct: false)
      ], explanation: "The correct answer will be is as it is a Singular form."),
      Question(text: "What is 32 / 4?", answers: [
        Answer(text: "7", correct: false),
        Answer(text: "8", correct: true),
        Answer(text: "9", correct: false),
        Answer(text: "10", correct: false)
      ], explanation: "The correct answer will be is as it is a Singular form."),
      Question(text: "What is 100 / 2?", answers: [
        Answer(text: "100", correct: false),
        Answer(text: "30", correct: false),
        Answer(text: "40", correct: false),
        Answer(text: "50", correct: true)
      ], explanation: "The correct answer will be is as it is a Singular form.")
    ]
  ]
  
  // MARK: - Public methods
  
  public func shuffleQuestions() {
    guard let questions = defaultQuestions[levelType]?.shuffled()
    else {
      return
    }
    
    questionNumber = 1
    self.questions = questions
  }
  
  public func upQuestionNumber() {
    currentQuestion = self.questions[questionNumber - 1]
    questionNumber += 1
  }
}
