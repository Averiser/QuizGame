//
//  CustomFinalCell.swift
//  QuizGame
//
//  Created by MyMacBook on 08.02.2023.
//

import UIKit

class CustomFinalCell: UITableViewCell {


//  @IBOutlet weak var questionLabel: UILabel!
  
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var option1: UILabel!
  @IBOutlet weak var option2: UILabel!
  @IBOutlet weak var option3: UILabel!
  @IBOutlet weak var option4: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
  
  // MARK: - Public methods
  
//  public func configure(with question: Question, with answer: Answer) {
//    questionLabel.text = question.text
//    option1.text = answer.text
//    option2.text = answer.text
//    option3.text = answer.text
//    option4.text = answer.text
//  }
  
  public func configure(with question: Question) {
    questionLabel.text = question.text

  }
    
}
