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
    
    
    // MARK: - Public methods
    
    public func configure(with question: Question, with answers: [Answer]) {
      questionLabel.text = question.text
//      option1.text = questionManager.currentQuestion?.answers[0].text
      // Thread 1: Fatal error: Unexpectedly found nil while implicitly unwrapping an Optional value
        option1.text = question.answers[0].text
        option2.text = question.answers[1].text
        option3.text = question.answers[2].text
        option4.text = question.answers[3].text
            }
  }

//extension Collection {
//    /// Returns the element at the specified index if it is within bounds, otherwise nil.
//    subscript (safe index: Index) -> Element? {
//        return indices.contains(index) ? self[index] : nil
//    }
//}
