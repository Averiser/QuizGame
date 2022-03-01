//
//  ViewController.swift
//  QuizGame
//
//  Created by MyMacBook on 01.03.2022.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func startGame() {
    let vc = storyboard?.instantiateViewController(identifier: "game") as! GameViewController
    vc.modalPresentationStyle = .fullScreen
    present(vc, animated: true)
  }


}

