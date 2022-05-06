//
//  ViewController.swift
//  QuizGame
//
//  Created by MyMacBook on 01.03.2022.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var startBtn: UIButton!
  
  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
//    view.backgroundColor = .systemTeal
//    navigationItem.title = "Quiz Game"
//    let button = UIButton(frame: CGRect(x: 200, y: 200, width: 200, height: 40))
//    button.backgroundColor = .systemBlue
//    button.center
//    view.addSubview(button)
//    button.setTitle("Start", for: .normal)
//    button.layer.cornerRadius = 0.5 // doesn't work, 'm doing smth wrong.
//    button.addTarget(self, action: #selector(navigateToGame), for: .touchUpInside)
    
    view.addSubview(startBtn)
    startBtn.layer.cornerRadius = 0.05 * startBtn.bounds.size.width
  }
  
  // MARK: - Private  methods
  
 @objc private func navigateToGame() {
    let vc = storyboard?.instantiateViewController(withIdentifier: "level") as! LevelsViewController
//    let rootVC = UIViewController()
//    let navVC = UINavigationController(rootViewController: UIViewController())
    
//    present(navVC, animated: true)
    navigationController?.pushViewController(vc, animated: true)
  }

  //  MARK: - IBActions
  
  @IBAction func startGame() {
    navigateToGame()
  }
}

