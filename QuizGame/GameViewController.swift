//
//  GameViewController.swift
//  QuizGame
//
//  Created by MyMacBook on 01.03.2022.
//

import UIKit

class GameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  var gameModels = [Question]()
  
  var currentQuestion: Question?
  
  @IBOutlet var label: UILabel!
  @IBOutlet var table: UITableView!

  

    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuestions()
        
    }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    configureUI(question: gameModels.first!)
  }
  
  private func configureUI(question: Question) {
    label.text = question.text
    currentQuestion = question
    table.delegate = self // configuring the tableView
    table.dataSource = self // configuring the tableView
  }
  
  private func checkAnswer(answer: Answer, question: Question) -> Bool {
    
    return question.answers.contains(where: { $0.text == answer.text }) && answer.correct
    
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
  
  // Table view functons
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    currentQuestion?.answers.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = currentQuestion?.answers[indexPath.row].text
    return cell
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
