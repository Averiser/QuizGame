//
//  Created by MyMacBook on 01.04.2023.
//

import UIKit

protocol ViewControllerFactory {
  func questionViewController(for question: Question<String>, answerCallback: @escaping ([String]) -> Void) -> UIViewController
  
  func resultsViewController(for result: Result<Question<String>, [String]>) -> UIViewController
} 
