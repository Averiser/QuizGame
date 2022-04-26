//
//  QuestionSets.swift
//  QuizGame
//
//  Created by MyMacBook on 26.04.2022.
//

import Foundation

struct QuestioinSets {
  
  static let questionSets = [
    "Beginners": [
      //  private var questions = [
          Question(text: "What is 2 + 2?", answers: [
            Answer(text: "1", correct: false),
            Answer(text: "2", correct: false),
            Answer(text: "4", correct: true),
            Answer(text: "7", correct: false)
            ]),
          Question(text: "What is 2 + 10?", answers: [
            Answer(text: "1", correct: false),
            Answer(text: "12", correct: true),
            Answer(text: "4", correct: false),
            Answer(text: "7", correct: false)
            ]),
          Question(text: "What is 7 - 1?", answers: [
            Answer(text: "1", correct: false),
            Answer(text: "0", correct: false),
            Answer(text: "6", correct: true),
            Answer(text: "3", correct: false)
            ]),
          Question(text: "What is 100 + 50?", answers: [
            Answer(text: "3", correct: false),
            Answer(text: "12", correct: false),
            Answer(text: "150", correct: true),
            Answer(text: "70", correct: false)
            ]),
          Question(text: "What is 2 + 0?", answers: [
            Answer(text: "1", correct: false),
            Answer(text: "5", correct: false),
            Answer(text: "4", correct: false),
            Answer(text: "2", correct: true)
            ])
      //  ]
    ],
    "Middle": [
      Question(text: "What is 2 * 2?", answers: [
        Answer(text: "1", correct: false),
        Answer(text: "2", correct: false),
        Answer(text: "4", correct: true),
        Answer(text: "7", correct: false)
        ]),
      Question(text: "What is 2 * 10?", answers: [
        Answer(text: "1", correct: false),
        Answer(text: "12", correct: false),
        Answer(text: "20", correct: true),
        Answer(text: "7", correct: false)
        ]),
      Question(text: "What is 3 * 3?", answers: [
        Answer(text: "1", correct: false),
        Answer(text: "2", correct: false),
        Answer(text: "9", correct: true),
        Answer(text: "19", correct: false)
        ]),
      Question(text: "What is 4 * 4?", answers: [
        Answer(text: "16", correct: true),
        Answer(text: "8", correct: false),
        Answer(text: "20", correct: false),
        Answer(text: "28", correct: false)
        ]),
      Question(text: "What is 5 * 5?", answers: [
        Answer(text: "6", correct: false),
        Answer(text: "25", correct: true),
        Answer(text: "14", correct: false),
        Answer(text: "7", correct: false)
        ])
    ],
    "Advanced": [
      Question(text: "What is 2 / 2?", answers: [
        Answer(text: "1", correct: true),
        Answer(text: "2", correct: false),
        Answer(text: "4", correct: false),
        Answer(text: "7", correct: false)
        ]),
      Question(text: "What is 10 / 2?", answers: [
        Answer(text: "1", correct: false),
        Answer(text: "12", correct: false),
        Answer(text: "4", correct: false),
        Answer(text: "5", correct: true)
        ]),
      Question(text: "What is 27 / 3?", answers: [
        Answer(text: "10", correct: false),
        Answer(text: "9", correct: true),
        Answer(text: "11", correct: false),
        Answer(text: "12", correct: false)
        ]),
      Question(text: "What is 32 / 4?", answers: [
        Answer(text: "7", correct: false),
        Answer(text: "8", correct: true),
        Answer(text: "9", correct: false),
        Answer(text: "10", correct: false)
        ]),
      Question(text: "What is 100 / 2?", answers: [
        Answer(text: "100", correct: false),
        Answer(text: "30", correct: false),
        Answer(text: "40", correct: false),
        Answer(text: "50", correct: true)
        ])
    ]
  ]
  
}
