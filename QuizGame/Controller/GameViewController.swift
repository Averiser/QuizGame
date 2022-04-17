//
//  GameViewController.swift
//  QuizGame
//
//  Created by MyMacBook on 01.03.2022.
//

import UIKit

class GameViewController: UIViewController {
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var questionCounterLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var progressView: UIProgressView!
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
  ]
  private var shuffledQuestions: [Question] = []
  private var currentQuestion: Question?
  private var questionNumber: Int = 0
  private var score: Int = 0
  
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
    tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
  }
  
  // MARK: - QuizGame
  
  private func shuffleQuestions() {
    shuffledQuestions = questions.shuffled()
    questionNumber = 1
    score = 0
    showQuestion()
  }
  
  private func showQuestion() {
//    let randomQuestion = questions.randomElement()
//    currentQuestion = randomQuestion
    
    let stepProgress = Float(questionNumber - 1) / Float(questions.count)
    progressView.progress = stepProgress
    
    questionCounterLabel.text = "\(questionNumber)/\(questions.count)"
    scoreLabel.text = "Score: \(score)"
    
    currentQuestion = shuffledQuestions[questionNumber - 1]
    questionNameLabel.text = currentQuestion?.text ?? ""
    
    questionNumberLabel.text = "Question \(questionNumber)"
    questionNumber += 1
    
//        self.progressView.frame.size.width = (self.view.frame.size.width / CGFloat(self.questions.count)) * CGFloat(self.questionNumber)

    tableView.reloadData()
    
//    guard let index = questions.firstIndex(where: { $0.text == currentQuestion?.text }) else { return }
//    questions.remove(at: index)
  }

  private func checkAnswer(for answer: Answer) {
    if answer.correct {
//      cell.turnGreen()
      if questionNumber > questions.count {
        // filling the scale fully
        progressView.progress = Float(questions.count)
        score += 1
        scoreLabel.text = "Score: \(score)"
//        answer.turnGreen()
        
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
//      answer.turnGreen()
      score += 1
      showQuestion()
    } else {
      // wrong
      
      if questionNumber > questions.count {
        // filling the scale fully
        progressView.progress = Float(questions.count)
        scoreLabel.text = "Score: \(score)"
        
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
//      answer.turnRed()
      showQuestion()
    }
  }
  
}
  
  // MARK: - UITableViewDelegate, UITableViewDataSource
  
  extension GameViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      currentQuestion?.answers.shuffle()
      return currentQuestion?.answers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else {
        return UITableViewCell()
      }
      cell.textLabel?.text = currentQuestion?.answers[indexPath.row].text
      return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      tableView.deselectRow(at: indexPath, animated: true)
      
      guard let cell = tableView.cellForRow(at: indexPath) as? CustomTableViewCell else { return }
    
      guard let question = currentQuestion else { return }
      let answer = question.answers[indexPath.row]
      
      checkAnswer(for: answer)
      
      if answer.correct {
        cell.turnGreen()
      } else {
        cell.turnRed()
      }

  
    }
    
  }
  
  

  
  
  
  



