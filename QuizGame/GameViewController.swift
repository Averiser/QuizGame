//
//  GameViewController.swift
//  QuizGame
//
//  Created by MyMacBook on 01.03.2022.
//

import UIKit

class GameViewController: UIViewController {
  
  var gameModels = [Question]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuestions()
        
    }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    configureUI()
  }
  
  private func configureUI() {
    
  }
  
  private func setupQuestions() {
    gameModels.append(Question(text: "What is 2 + 2?", answers: [
    Answer(text: "1", correct: false),
    Answer(text: "2", correct: false),
    Answer(text: "4", correct: true),
    Answer(text: "7", correct: false)
    ]))
    
    gameModels.append(Question(text: "What is 2 + 10?", answers: [
    Answer(text: "1", correct: false),
    Answer(text: "12", correct: true),
    Answer(text: "4", correct: false),
    Answer(text: "7", correct: false)
    ]))
    
    gameModels.append(Question(text: "What is 2 + 0?", answers: [
    Answer(text: "1", correct: false),
    Answer(text: "5", correct: false),
    Answer(text: "4", correct: false),
    Answer(text: "2", correct: true)
    ]))
  }
    
  struct Question {
    let text: String
    
    let answers: [Answer]
  }
  
  struct Answer {
    let text: String
    let correct: Bool // true/false
  }

}
