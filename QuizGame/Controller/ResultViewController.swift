//
//  ResultViewController.swift
//  QuizGame
//
//  Created by MyMacBook on 18.01.2023.
//

import UIKit
import GameplayKit

class ResultViewController: UIViewController {
  
  //   MARK: - Properties
  
  private var questionManager: QuestionManager!
  private var gameVC: GameViewController!
  private var questions: [Question] = []
  private var answers: [Answer] = []
//  private (set) var currentQuestion: Question?
  //  private var answers: Dictionary<Question<String>, [String]> = [:]
  public var g = SystemRandomNumberGenerator()
    
  // MARK: - Create
  
  static func create(with questionManager: QuestionManager) -> ResultViewController {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "result") as! ResultViewController
    vc.questionManager = questionManager
    //    vc.questionManager.questions = questionManager.questions
    return vc
  }
  
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: - Private methods
  
  
  private func configureTableView() {
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UINib(nibName: "CustomFinalCell", bundle: nil), forCellReuseIdentifier: "customFinalCell")
    //    tableView.backgroundColor = .gray
    //    self.tableView.reloadData()
//    tableView.register(CustomFinalCell.self, forCellReuseIdentifier: "customFinalCell")
  }
  
  //  private func configureQuestionsArrayView() {
  //      let questionsArrayView = QuestionsArrayView(questions: questions)
  //          view.addSubview(questionsArrayView)
  //    tableView.addSubview(questionsArrayView)
  //  }
  
//  private func configureQuestionView() {
//    for question in questions {
//      let questionView = QuestionView(question: question)
//      tableView.addSubview(questionView)
//    }
//  }
  
//  private func configureQuestionView() {
//    let resulVC = ResultViewController()
//    for answer in answers {
//      let questionView = QuestionView(answer: answer)
//      tableView.addSubview(questionView)
//      present(resulVC, animated: false)
//    }
//  }
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .cyan
    navigationItem.setHidesBackButton(true, animated: true)
    configureTableView()
    
//    let seed = gameVC?.source.seed
    
    //      configureQuestionsArrayView()  // doesn't work, nothing shows up on the screen 2023-03-17
//    configureQuestionView()
    
    //      }
  }

}

// MARK: UITableViewDelegate, UITableViewDataSource

extension ResultViewController: UITableViewDelegate, UITableViewDataSource {
  
//  func numberOfSections(in tableView: UITableView) -> Int {
//    return questionManager.questions.count
//  }
//  when this is active, 20 qu-anws blocks pop up (instead of 4)...
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    gameVC.shuffleAnswers()
    
//    let seed =
//    let source = GKLinearCongruentialRandomSource(seed: seed)
        return questionManager.questions.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "customFinalCell", for: indexPath) as? CustomFinalCell else {
      return UITableViewCell()
    }
        
    var question = questionManager.questions[indexPath.row]
    
//    question.answers.shuffle(using: &myGenerator)
    
//    shuffleAnswers()

//    question.answers.shuffleM(using: &g)
//    question.answers.shuffleN
    
    let answers = question.answers
    
//    questionManager.currentQuestion?.answers.shuffle()
    
    question.answers.shuffle()
    
    cell.configure(with: question, with: answers)
        
    return cell
  }
}

//extension Array {
//  func getElement(at index: Int) -> Element? {
//    let isValidIndex = index >= 0 && index < count
//    return isValidIndex ? self[index] : nil
//  }
//}
//
//extension Collection {
//  subscript(index i: Index) -> Element? {
//    return indices.contains(i) ? self[i] : nil
//
//  }
//}
