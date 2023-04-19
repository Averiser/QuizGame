//
//  CustomFinalCell.swift
//  QuizGame
//
//  Created by MyMacBook on 08.02.2023.
//

import UIKit

class CustomFinalCell: UITableViewCell {
  
  private var questionManager: QuestionManager!
    
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
  
  //  option1.text = viewWithTag(1) as? String
  
  // MARK: - Public methods
  
  public func configure(with question: Question) {
      questionLabel.text = question.text
      option3 = viewWithTag(3) as? UILabel
      
//      guard let questionManagerUnwrapped = questionManager else {return}
      
//      option1.text = questionManagerUnwrapped.currentQuestion?.answers[1].text
//        option1.text = question.answers[indexPath.row].text

      option3.text = "iyx"
//      option4.text = answer.text
    }
}
