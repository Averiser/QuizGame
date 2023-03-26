//
//  LevelsViewController.swift
//  QuizGame
//
//  Created by MyMacBook on 18.04.2022.
//

import UIKit

class LevelsViewController: UIViewController {

  @IBOutlet weak var elementaryBtn: UIButton!
  @IBOutlet weak var middleBtn: UIButton!
  @IBOutlet weak var advancedBtn: UIButton!
  
  // MARK: - Dependency
  
  private let questionManager = QuestionManager()
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
      super.viewDidLoad()
//      createButton()
      configureButtons()
  }
  
 func configureButtons() {
    elementaryBtn.layer.cornerRadius = 0.05 * elementaryBtn.bounds.size.width
    middleBtn.layer.cornerRadius = 0.05 * middleBtn.bounds.size.width
    advancedBtn.layer.cornerRadius = 0.05 * advancedBtn.bounds.size.width
  }
  
  @IBAction func startGame(_ sender: Any) {
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    let vc = storyboard.instantiateViewController(withIdentifier: "game") as! GameViewController
    guard let button = sender as? UIButton,
          let text = button.titleLabel?.text,
          let levelType = QuestionManager.LevelType(rawValue: text) else {
        print("Could not get button's text")
            return
          }
    
//    guard let questions = QuestionManager.questions[levelType]
//      else {
//      print("No question set exists for \(levelType)")
//      return
//    }
//    vc.questions = questions
    
    questionManager.levelType = levelType
    let vc = GameViewController.create(with: questionManager)
    navigationController?.pushViewController(vc, animated: true)
  }
}

