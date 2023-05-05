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
  private var answers: [Answer] = []
//  private (set) var currentQuestion: Question?
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
    answers = question.answers
    
//    let answers = question.answers
    
//    guard let questionManagerUnwrapped = questionManager else { return UITableViewCell() }
    
//    func getFirstElement(arr: [String]) -> String? {
//      guard (answers.count < 0) else { return nil }
//      return arr[0]
//    }
//
//    func getFourthElement(arr: [String]) -> String? {
//      guard (answers.count >= 4) else { return nil }
//      return arr[3]
//    }
  
//     let answer = question.answers[indexPath.row]
//    else {return UITableViewCell()}
//        var sliceOfArray = question.answers[0...3]
    //
//        sliceOfArray =
    
//    for answer in answers {
//      answers.getElement(at: indexPath.row)
//    }
          
//    let answer = question.answers[index] where index >=  startIndex, index < endIndex
//    let index = indexPath.row
    
//    guard let answer = question.answers.dropFirst(1).last else { return UITableViewCell() }
    
//    guard let answer = question.answers.first else {return UITableViewCell()}

//    for answer in answers {
//      guard let answer = question.answers.first else { return UITableViewCell()}
//      
//    }
    
//    for answer in answers {
//      if let item = answers[safe: answer[indexPath.row]] {
//        return item
//      }
//    }
        
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
