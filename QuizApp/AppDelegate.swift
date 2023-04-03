//
//  AppDelegate.swift
//  QuizGame
//
//  Created by MyMacBook on 01.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var game: Game<Question<String>, [String], NavigationControllerRouter>?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
//    let window = UIWindow(frame: UIScreen.main.bounds)
//    window.rootViewController = QuestionViewController(question: "A question?", options: ["Option 1", "Option 2"]) { print($0)
//    }
//    self.window = window
//    window.makeKeyAndVisible()
    let question1 = Question.singleAnswer("What's Mike's nationality?")
    let question2 = Question.multipleAnswer("What are Caio's nationalities?")
    let questions = [question1, question2]

    let option1 = "Canadian"
    let option2 = "American"
    let option3 = "Greek"
    let options1 = [option1, option2, option3]
    
    let option4 = "Portuguese"
    let option5 = "American"
    let option6 = "Brazilian"
    let options2 = [option4, option5, option6]

    let correctAnswers = [question1: [option3], question2: [option4, option6]]

    let navigationController = UINavigationController()
    let factory = iOSViewControllerFactory(questions: questions, options: [question1: options1, question2: options2], correctAnswers: correctAnswers)

    let router = NavigationControllerRouter(navigationController, factory: factory)
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()

    game = startGame(questions: questions, router: router, correctAnswers: correctAnswers)
//
    return true
  }

  // MARK: UISceneSession Lifecycle

//  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//  }

//  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//  }


}

