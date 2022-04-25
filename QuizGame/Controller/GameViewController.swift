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
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: - Properties
  
  
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
  
  var questions: [Question]!
  private var shuffledQuestions: [Question] = []
  private var currentQuestion: Question?
  private var questionNumber: Int = 0
  private var score: Int = 0
  
  // MARK: - Lifecycle
  
//  var QuestionView = UITableView()
//  self.view.addSubview(questionView)

    override func viewDidLoad() {
      super.viewDidLoad()
      configureTableView()
      shuffleQuestions()
      
      for question in questions {
        let questionView = QuestionView(question: question)
//        // Add `questionView` to a `UITableView`,
//                 // or add it as a subview of `self.view` and
//                 // then position it using constraints
        self.view.addSubview(questionView)
      }


    }
  
  // MARK: - Configure UI
  
  private func configureTableView() {
    
//    self.view.addSubview(questionView)
    
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

    tableView.reloadData()

  }
  
  private func updateUI() {
    progressView.progress = Float((questionNumber-1)/questions.count)
    scoreLabel.text = "Score: \(score)"
    
    if questionNumber > questions.count {
      let alert = UIAlertController(title: "Awesome",
                                    message: "End of Quiz. Do you want to start over?",
                                    preferredStyle: .alert)
      let restartAction = UIAlertAction(title: "Restart",
                                        style: .default,
                                        handler: { action in self.shuffleQuestions() } )
      alert.addAction(restartAction)
      present(alert, animated: true, completion: nil)
    } else {
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
            
      if answer.correct {
        score += 1
        cell.turnGreen()
      } else {
        cell.turnRed()
      }
      
      DispatchQueue.main.asyncAfter(deadline: .now()+1) {
        self.updateUI()
      }
      
    }
    
  }
  
  

  
  
  
  



