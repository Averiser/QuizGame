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
  
  var questions: [Question]!
  private var shuffledQuestions: [Question] = []
  private var currentQuestion: Question?
  private var questionNumber: Int = 0
  private var score: Int = 0
  
  let userDefaults = UserDefaults()
  
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
  
  private func answersList() {
    UserDefaults.standard.string(forKey: "key")
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
  
  func popToLevelsViewController() {
//      if let firstViewController = self.navigationController?.viewControllers[1] {
//          self.navigationController?.popToViewController(firstViewController, animated: true)
//      }
  
  guard let viewControllers = self.navigationController?.viewControllers else { return }

  for firstViewController in viewControllers {
    if firstViewController is LevelsViewController {
      self.navigationController?.popToViewController(firstViewController, animated: true)
      break
      }
    }
  }
  
  private func updateUI() {
    progressView.progress = Float((questionNumber-1)/questions.count)
    scoreLabel.text = "Score: \(score)"
    
    if questionNumber > questions.count {
      let alert = UIAlertController(title: "Awesome",
                                    message: "End of Quiz. Your result is: \(score) out of \(questions.count)! Do you want to start over?",
                                    preferredStyle: .alert)
      let restartAction = UIAlertAction(title: "Restart",
                                        style: .default,
                                        handler: { action in self.shuffleQuestions() } )
      let mainPageAction = UIAlertAction(title: "Return to main menu",
                                         style: .default,
                                         handler: { action in self.popToLevelsViewController() } )
      let explanationAction = UIAlertAction(title: "Answer explanations",
                                            style: .default,
                                            handler: { action in
                                                self.answersList() }
                                            )
      alert.addAction(restartAction)
      alert.addAction(mainPageAction)
      alert.addAction(explanationAction)
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
  
  

  
  
  
  



