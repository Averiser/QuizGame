//
//  GameViewController.swift
//  QuizGame
//
//  Created by MyMacBook on 01.03.2022.
//

import UIKit

class GameViewController: UIViewController {
  
  // MARK: - IBOutlets
  
  @IBOutlet private var questionNumberLabel: UILabel!
  @IBOutlet private var questionNameLabel: UILabel!
  @IBOutlet private var tableView: UITableView!
  
  // MARK: - Properties
  
  private var questions = [
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
    Question(text: "What is 2 + 0?", answers: [
      Answer(text: "1", correct: false),
      Answer(text: "5", correct: false),
      Answer(text: "4", correct: false),
      Answer(text: "2", correct: true)
      ])
  ]
  private var shuffledQuestions: [Question] = []
  private var currentQuestion: Question?
  private var questionNumber: Int = 1
  
  // MARK: - Lifecycle

    override func viewDidLoad() {
      super.viewDidLoad()
      configureTableView()
      shuffleQuestions()
    }
  
  // MARK: - Configure UI
  
  private func configureTableView() {
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  // MARK: - QuizGame
  
  private func shuffleQuestions() {
    shuffledQuestions = questions.shuffled()
    questionNumber = 1
    showQuestion()
  }
  
  private func showQuestion() {
//    let randomQuestion = questions.randomElement()
//    currentQuestion = randomQuestion
    currentQuestion = shuffledQuestions[questionNumber - 1]
    questionNameLabel.text = currentQuestion?.text ?? ""
    
    questionNumberLabel.text = "Question \(questionNumber)"
    questionNumber += 1
    tableView.reloadData()
    
//    guard let index = questions.firstIndex(where: { $0.text == currentQuestion?.text }) else { return }
//    questions.remove(at: index)
  }

  private func checkAnswer(for answer: Answer) {
    
    if answer.correct {
      if questionNumber > 3 {
              let alert = UIAlertController(title: "Awesome",
                                            message: "End of Quiz. Do you want to start over?",
                                            preferredStyle: .alert)
              let restartAction = UIAlertAction(title: "Restart",
                                                style: .default,
                                                handler: { action in self.shuffleQuestions() } )
              alert.addAction(restartAction)
              present(alert, animated: true, completion: nil)
        return
      }
      
      showQuestion()
    } else {
      // wrong
      let alert = UIAlertController(title: "Wrong",
                                    message: "You failed",
                                    preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Dismiss",
                                    style: .cancel,
                                    handler: nil))
      present(alert, animated: true)
    }
  }
  
}
  
  // MARK: - UITableViewDelegate, UITableViewDataSource
  
  extension GameViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//      currentQuestion?.answers.shuffle()
      return currentQuestion?.answers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      cell.textLabel?.text = currentQuestion?.answers[indexPath.row].text
      return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      tableView.deselectRow(at: indexPath, animated: true)
    
      guard let question = currentQuestion else { return }
      let answer = question.answers[indexPath.row]
      
      checkAnswer(for: answer)
    }
  }
  
  

  
  
  
  



