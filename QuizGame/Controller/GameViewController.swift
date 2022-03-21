//
//  GameViewController.swift
//  QuizGame
//
//  Created by MyMacBook on 01.03.2022.
//

import UIKit

class GameViewController: UIViewController {
  
  // MARK: - IBOutlets
  
  @IBOutlet var questionNameLabel: UILabel!
  @IBOutlet var tableView: UITableView!
  
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
  
  private var currentQuestion: Question?
  
  // MARK: - Lifecycle

    override func viewDidLoad() {
      super.viewDidLoad()
      configureTableView()
      showQuestion()
    }
  
  // MARK: - Configure UI
  
  private func configureTableView() {
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  // MARK: - QuizGame
  
  private func showQuestion() {
    let randomQuestion = questions.randomElement()
    currentQuestion = randomQuestion
    questionNameLabel.text = currentQuestion?.text ?? ""
    
    guard let index = questions.firstIndex(where: { $0.text == randomQuestion?.text }) else { return }
    questions.remove(at: index)
    
    tableView.reloadData()
  }
  
  private func checkAnswer(for answer: Answer) {
    
    if answer.correct {
      
      if questions.isEmpty {
        let alert = UIAlertController(title: "Done", message: "You beat the game!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
        return
      }
      
      showQuestion()
    } else {
      // wrong
      let alert = UIAlertController(title: "Wrong", message: "You failed", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
      present(alert, animated: true)
    }
  }
}
  
  // MARK: - UITableViewDelegate, UITableViewDataSource
  
  extension GameViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      currentQuestion?.answers.count ?? 0
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
  
  

  
  
  
  



