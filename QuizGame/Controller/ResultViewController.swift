//
//  ResultViewController.swift
//  QuizGame
//
//  Created by MyMacBook on 18.01.2023.
//

import UIKit

class ResultViewController: UIViewController {
  
  //   MARK: - Properties
  
  private var questionManager: QuestionManager!
  private var questions: [Question] = []
  //  private var answers: Dictionary<Question<String>, [String]> = [:]
  
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
    print("Hello, world!")
  }
  
  //  private func configureQuestionsArrayView() {
  //      let questionsArrayView = QuestionsArrayView(questions: questions)
  ////          view.addSubview(questionsArrayView)
  //    tableView.addSubview(questionsArrayView)
  //  }
  
  private func configureQuestionView() {
    for question in questions {
      let questionView = QuestionView(question: question)
      tableView.addSubview(questionView)
    }
  }
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .cyan
    navigationItem.setHidesBackButton(true, animated: true)
    configureTableView()
    //      configureQuestionsArrayView()  // doesn't work, nothing shows up on the screen 2023-03-17
//    configureQuestionView()
    
    //      }
  }
  //  override func viewWillAppear(_ animated: Bool) {
  //    super.viewWillAppear(animated)
  //    tableView.backgroundColor = .purple
  //    configureTableView()
  //    configureQuestionsArrayView()
  //  }
//  private func numberItems(_ qu: Int, _ anws: Int) -> Int {
//
//    guard let a = questionManager.currentQuestion?.answers.count else {return 1}
//    let b = questionManager.questions.count
//    return a + b
//  }
  
}

// MARK: UITableViewDelegate, UITableViewDataSource

extension ResultViewController: UITableViewDelegate, UITableViewDataSource {
  
//  func numberOfSections(in tableView: UITableView) -> Int {
//    return questionManager.questions.count
//  } when this is active, 20 qu-anws blocks pop up (instead of 4)...
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    questionManager.questions.count
//    5
//    questionManager.currentQuestion?.answers.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "customFinalCell", for: indexPath) as? CustomFinalCell else {
      return UITableViewCell()
    }
        
    let question = questionManager.questions[indexPath.row]
    cell.configure(with: question)
    
//    if let answer = questionManager.currentQuestion?.answers[indexPath.row] { cell.configure(with: question, with: answer)
//    }
    
//    guard let answer = questionManager.currentQuestion?.answers[indexPath.row] else { fatalError("Smth is going on...") }

    
//    guard let answer = questionManager.currentQuestion?.answers[indexPath.row] else { return UITableViewCell()}
    
//    let answer = questionManager.currentQuestion?.answers[indexPath.row]
//
//    cell.configureAnswers(with: answer)
    
//    cell.questionLabel?.text = questions[indexPath.row].text
    
    return cell
  }
}
