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
  
  override func viewDidLoad() {
      super.viewDidLoad()
//      createButton()
      configureButtons()
  }
  
 private func configureButtons() {
    elementaryBtn.layer.cornerRadius = 0.05 * elementaryBtn.bounds.size.width
    middleBtn.layer.cornerRadius = 0.05 * middleBtn.bounds.size.width
    advancedBtn.layer.cornerRadius = 0.05 * advancedBtn.bounds.size.width
  }
  
// func createButton() {
//    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
//    let button2 = UIButton(frame: CGRect(x: 100, y: -200, width: 200, height: 50))
//    button.center = view.center
//    button2.center = view.rightAnchor
//
//    button.configuration = createConfig()
//   button2.configuration = createConfig2()
//    view.addSubview(button)
//   view.addSubview(button2)
//  }
//
//  func createConfig() -> UIButton.Configuration {
//    var config: UIButton.Configuration = .filled()
//    config.title = "Middle"
//    config.cornerStyle = .medium
//
//    return config
//  }
//
//  func createConfig2() -> UIButton.Configuration {
//    var config2: UIButton.Configuration = .filled()
//    config2.title = "Elementary"
//    config2.cornerStyle = .medium
//
//    return config2
//  }
  
  
  
  private func navigateToGame() {
    let vc = storyboard?.instantiateViewController(withIdentifier: "game") as! GameViewController
    vc.modalPresentationStyle = .fullScreen
    present(vc, animated: true)
    
  }
  
  @IBAction func startGame() {
    navigateToGame()
  }
  

}

//extension UIButton.Configuration {
//  let button = UIButton.corner
//}
