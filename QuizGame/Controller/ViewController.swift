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
    startBtn.layer.cornerRadius = 0.05 * startBtn.bounds.size.width
  }
  
  // MARK: - Private  methods
  
  private func navigateToGame() {
    let vc = storyboard?.instantiateViewController(withIdentifier: "level") as! LevelsViewController
    let rootVC = UIViewController()
    let navVC = UINavigationController(rootViewController: rootVC)
    
    present(navVC, animated: true)
    navVC.pushViewController(vc, animated: true)
    
  }

  //  MARK: - IBActions
  
  @IBAction func startGame() {
    navigateToGame()
  }
}

