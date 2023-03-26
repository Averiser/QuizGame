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
  
    override func awakeFromNib() {
        super.awakeFromNib()
    }
  
//  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//    super.init(style: style, reuseIdentifier: reuseIdentifier)
//  }
//
//  required init?(coder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
//
//
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
  
  // MARK: - Public methods
  
  public func configure(with question: Question) {
    questionLabel.text = question.text

  }
    
}
