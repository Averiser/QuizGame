//
//  SceneDelegate.swift
//  QuizGame
//
//  Created by MyMacBook on 01.03.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

//  var window: UIWindow?
//    var game: Game<Question<String>, [String], NavigationControllerRouter>?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//    window = UIWindow(frame: windowScene.coordinateSpace.bounds)
//            window?.windowScene = windowScene
    
//    let viewController = QuestionViewController(question: "A question?", options: ["Option 1", "Option 2"]) { print($0) }
    
//    let viewController = ResultsViewController(summary: "You got 1/2 correct", answers: [
//      PresentableAnswer(question: "Question? QuestionQuestionQuestionQuestionQuestionQuestionQuestionQuestionQuestionQuestion", answer: "Yeah!", wrongAnswer: nil),
//      PresentableAnswer(question: "Another question?", answer: "Hell yeah!", wrongAnswer: "Hell no!")
//    ])
//      
//        let question = Question.singleAnswer("What's Mike's nationality?")
//        let questions = [question]
//    
//        let option1 = "Canadian"
//        let option2 = "American"
//        let option3 = "Greek"
//        let options = [option1, option2, option3]
//    
//        let correctAnswers = [question: [option3]]
//    
//        let navigationController = UINavigationController()
//        let factory = iOSViewControllerFactory(questions: questions, options: [question: options], correctAnswers: correctAnswers)
//    
//        let router = NavigationControllerRouter(navigationController, factory: factory)
//    
//    
//        game = startGame(questions: questions, router: router, correctAnswers: correctAnswers)
    
    
    
//    _ = viewController.view
//    viewController.tableView.allowsMultipleSelection = true
//    window?.rootViewController = navigationController
//    window?.makeKeyAndVisible()
    
    
      }

  func sceneDidDisconnect(_ scene: UIScene) {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
  }

  func sceneDidBecomeActive(_ scene: UIScene) {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
  }

  func sceneWillResignActive(_ scene: UIScene) {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
  }

  func sceneWillEnterForeground(_ scene: UIScene) {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
  }

  func sceneDidEnterBackground(_ scene: UIScene) {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
  }


}

