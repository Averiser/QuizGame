//
//  ResultViewController.swift
//  QuizGame
//
//  Created by MyMacBook on 18.01.2023.
//

import UIKit

class ResultViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
//   MARK: - Properties

//  var questionView: UIView!

  public var questions: [Question] = [] {
    didSet {
      print(questions)
    }
  }
  
  private func configureTableView() {

    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UINib(nibName: "CustomFinalCell", bundle: nil), forCellReuseIdentifier: "CustomFinalCell")
//    tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
    tableView.reloadData()
  }
  
  
  // MARK: - Lifecycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .cyan
        navigationItem.setHidesBackButton(true, animated: true)
      configureTableView()
     
//      for question in questions {
//        let questionView = QuestionView(question: question)
//        self.view.addSubview(questionView)
//      }
      
    }
}

// MARK: UITableViewDelegate, UITableViewDataSource

extension ResultViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return questions.count
//    return 50
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else {
//      return UITableViewCell()
//    }
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomFinalCell", for: indexPath) as? CustomFinalCell else {
      return UITableViewCell()
    }
    
//    if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomFinalCell", for: indexPath) as? CustomFinalCell {
//      cell.questionLabel.text = self.questions[indexPath.row].text
//      return cell
//    }
    
//    cell.textLabel?.text = "cell \(indexPath.row)"
//    return cell
    
    cell.questionLabel.text = self.questions[indexPath.row].text
          return cell
    
//    cell.textLabel?.text = questions[indexPath.row].text
//    return cell
//    return CustomFinalCell()
  }
  
}
