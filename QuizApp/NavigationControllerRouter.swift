//
//  NavigationControllerRouter.swift
//  QuizGame
//
//  Created by MyMacBook on 31.03.2023.
//

import UIKit

class NavigationControllerRouter: Router {
  
 private let navigationController: UINavigationController
  private let factory: ViewControllerFactory
  
  init(navigationController: UINavigationController, factory: ViewControllerFactory) {
    self.navigationController = navigationController
    self.factory = factory
  }
  
  func routeTo(question: Question<String>, answerCallback: @escaping ([String]) -> Void) {
      show(factory.questionViewController(for: question, answerCallback: answerCallback))
    }
  
  func routeTo(result: Result<Question<String>, [String]>) {
    show(factory.resultsViewController(for: result))
  }
  
  private func show(_ viewController: UIViewController) {
    navigationController.pushViewController(viewController, animated: true)
  }
  
  
}
