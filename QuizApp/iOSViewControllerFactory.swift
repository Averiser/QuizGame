//
//  Created by MyMacBook on 01.04.2023.
//

import UIKit

class iOSViewControllerFactory: ViewControllerFactory {
  
  private let options: Dictionary<Question<String>, [String]>
  
  init(options: Dictionary<Question<String>, [String]>) {
    self.options = options
  }
  
  func questionViewController(for question: Question<String>, answerCallback: @escaping ([String]) -> Void) -> UIViewController {
    
    guard let options = self.options[question] else {
      fatalError("Could not find options for question: \(question)")
    }
    return questionViewController(for: question, options: options, answerCallback: answerCallback)
  }
  
  private func questionViewController(for question: Question<String>, options: [String], answerCallback: @escaping ([String]) -> Void) -> UIViewController {
    switch question {
    case .singleAnswer(let value):
      return QuestionViewController(question: "", options: options, selection: answerCallback)
    case .multipleAnswer(let value):
      let controller = QuestionViewController(question: "", options: options, selection: answerCallback)
      _  =  controller.view
      controller.tableView.allowsMultipleSelection = true
      return controller
    }
  }
  
  func resultsViewController(for result: Result<Question<String>, [String]>) -> UIViewController {
    return
     UIViewController()
  }
}
