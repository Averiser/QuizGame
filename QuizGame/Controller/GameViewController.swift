//
//  GameViewController.swift
//  QuizGame
//
//  Created by MyMacBook on 01.03.2022.
//


import UIKit

class GameViewController: UIViewController {
  
  // MARK: - Create
  
  static func create(with questionManager: QuestionManager) -> GameViewController {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "game") as! GameViewController
    vc.questionManager = questionManager
    return vc
  }
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var questionCounterLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var progressView: UIProgressView!
  @IBOutlet private var questionNumberLabel: UILabel!
  @IBOutlet private var questionNameLabel: UILabel!
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: - Properties
  
//  var questions: [Question] = []
//  private var shuffledQuestions: [Question] = []
//  private var questionNumber: Int = 0
  private var questionManager: QuestionManager!
  private var score: Int = 0
  
  let userDefaults = UserDefaults()
  
  // MARK: - Lifecycle
  
//  var QuestionView = UITableView()
//  self.view.addSubview(questionView)

    override func viewDidLoad() {
      super.viewDidLoad()
//      view.backgroundColor = .purple
      configureTableView()
//      configureQuestionView()
//      showQuestion()
      questionManager.shuffleQuestions()
    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    showQuestion()
  }
  
  // MARK: - Private methods
  
  private func configureQuestionView() {
    for question in questionManager.questions {
      let questionView = QuestionView(question: question)
      view.addSubview(questionView)
    }
  }
  
  private func answersList() {
//    UserDefaults.standard.string(forKey: "key")
  }
  
  // MARK: - Configure UI
  
  private func configureTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
    print("Heil, Siegfrid!")
  }
  
  // MARK: - QuizGame
  
  private func showQuestion() {
    
    questionManager.upQuestionNumber()
    let stepProgress = Float(questionManager.questionNumber - 1) / Float(questionManager.questions.count)
    progressView.progress = stepProgress
    
    questionCounterLabel.text = "\(questionManager.questionNumber - 1)/\(questionManager.questions.count)"
    scoreLabel.text = "Score: \(score)"
    questionNameLabel.text = questionManager.currentQuestion?.text ?? ""
    
//    questionNameLabel.text = questions.text ?? ""
    
    questionNumberLabel.text = "Question \(questionManager.questionNumber - 1)"
//    questionNumber += 1
    
    tableView.reloadData()
  }
  
  func popToLevelsViewController() {
  guard let viewControllers = self.navigationController?.viewControllers else { return }

  for firstViewController in viewControllers {
    if firstViewController is LevelsViewController {
      self.navigationController?.popToViewController(firstViewController, animated: true)
      break
      }
    }
  }
  
  func pushToResultViewController() {
    let vc = ResultViewController.create(with: questionManager)
    self.navigationController?.pushViewController(vc, animated: true)
  }
  
  private func updateUI() {
    progressView.progress = Float((questionManager.questionNumber - 1)/questionManager.questions.count)
    scoreLabel.text = "Score: \(score)"
    
    if questionManager.questionNumber > questionManager.questions.count {
      let alert = UIAlertController(title: "Awesome",
                                    message: "End of Quiz. Your result is: \(score) out of \(questionManager.questions.count)! Do you want to start over?",
                                    preferredStyle: .alert)
      let restartAction = UIAlertAction(title: "Restart",
                                        style: .default,
                                        handler: { action in
        self.score = 0
        self.questionManager.shuffleQuestions()
        self.showQuestion()
      })
      let mainPageAction = UIAlertAction(title: "Return to main menu",
                                         style: .default,
                                         handler: { action in self.popToLevelsViewController() } )
      let explanationAction = UIAlertAction(title: "Answer explanations",
                                            style: .default,
                                            handler: { action in
                                                self.pushToResultViewController() }
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
      return questionManager.currentQuestion?.answers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else {
        return UITableViewCell()
      }
      cell.textLabel?.text = questionManager.currentQuestion?.answers[indexPath.row].text
      return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      tableView.deselectRow(at: indexPath, animated: true)
      
      guard let cell = tableView.cellForRow(at: indexPath) as? CustomTableViewCell else { return }
    
      guard let question = questionManager.currentQuestion else { return }
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
  
  

  
  
  
  



