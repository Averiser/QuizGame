//
//  ViewController.swift
//  QuizGame
//
//  Created by MyMacBook on 01.03.2022.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  // MARK: - Private  methods
  
 private func navigateToGame() {
      let vc = storyboard?.instantiateViewController(identifier: "game") as! GameViewController
    vc.modalPresentationStyle = .fullScreen
    present(vc, animated: true)
  }
  
  //  MARK: - IBActions
  
  @IBAction func startGame() {
    navigateToGame()
  }
}

