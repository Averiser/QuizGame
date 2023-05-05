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
    
  //  override func setSelected(_ selected: Bool, animated: Bool) {
  //    super.setSelected(selected, animated: animated)
  //  }
    
    
    // MARK: - Public methods
    
    public func configure(with question: Question, with answers: [Answer]) {
        questionLabel.text = question.text
  //        option1 = viewWithTag(1) as? UILabel
  //        option2 = viewWithTag(2) as? UILabel
  //        option3 = viewWithTag(3) as? UILabel
  //        option4 = viewWithTag(4) as? UILabel
      
  //    option2 = viewWithTag(2) as? UILabel
  //    option3 = viewWithTag(3) as? UILabel
  //    option4 = viewWithTag(4) as? UILabel
      
    
      
        
  //      guard let questionManagerUnwrapped = questionManager else {return}
        
  //      option1.text = questionManagerUnwrapped.currentQuestion?.answers[1].text
  //        option1.text = question.answers[indexPath.row].text

//      for answer in answers {
//        option1.text = answer.text
//  //      option2.text = answer.text
//        option3.text = answer.text
//        option4.text = answer.text
//      }
      option1.text = question.answers[0].text
      option2.text = question.answers[1].text
      option3.text = question.answers[2].text
      option4.text = question.answers[3].text
  //    option1.text = "iyx1"
  //      option4.text = answer.text
      }
  }

//extension Collection {
//    /// Returns the element at the specified index if it is within bounds, otherwise nil.
//    subscript (safe index: Index) -> Element? {
//        return indices.contains(index) ? self[index] : nil
//    }
//}
