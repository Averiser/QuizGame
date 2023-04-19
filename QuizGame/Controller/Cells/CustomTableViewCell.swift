//
//  CustomTableViewCell.swift
//  QuizGame
//
//  Created by MyMacBook on 16.04.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
  }
  
    func turnGreen() {
      let go_green = CASpringAnimation(keyPath: "backgroundColor")
      go_green.fromValue = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
      go_green.toValue = UIColor.green.cgColor
      go_green.duration = 2
      go_green.autoreverses = false
      go_green.repeatCount = 1
      go_green.initialVelocity = 3
      
      contentView.layer.add(go_green, forKey: "backgroundColor")
    }
  
    func turnRed() {
      let go_red = CABasicAnimation(keyPath: "backgroundColor")
      go_red.fromValue = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
      go_red.toValue = UIColor.red.cgColor
      go_red.duration = 2
      go_red.autoreverses = false
      go_red.repeatCount = 1
    //  go_red.initialVelocity = 3
      contentView.layer.add(go_red, forKey: "backgroundColor")
    }
  
  public func configure(with question: Question) {
//    questionLabel.text = question.text
  }

    
}
