//
//  GameViewController.swift
//  QuizGame
//
//  Created by MyMacBook on 01.03.2022.
//

import UIKit
import GameplayKit

class GameViewController: UIViewController {
  
  // MARK: - Create
  
  
  public var array: Array<Any> = []
  
//  public var g = SystemRandomNumberGenerator()
  
  static func create(with questionManager: QuestionManager) -> GameViewController {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "game") as! GameViewController
    vc.questionManager = questionManager
    return vc
  }
//  public func shuffleAnswers() {
//    questionManager.currentQuestion?.answers.shuffle
//  }
//  var myGenerator = SystemRandomNumberGenerator()
//
//  @inlinable
//  public func shuffleAnswers() {
////   var myGenerator = SystemRandomNumberGenerator()
//    questionManager.currentQuestion?.answers.shuffle(using: &myGenerator)
//  }
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var questionCounterLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var progressView: UIProgressView!
  @IBOutlet private var questionNumberLabel: UILabel!
  @IBOutlet private var questionNameLabel: UILabel!
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: - Properties
  
//  var questions: [Question] = []
//  private var shuffledQuestions: [Question] = []
//  private var questionNumber: Int = 0
  private var questionManager: QuestionManager!
  private var score: Int = 0
  
//  let source = GKLinearCongruentialRandomSource()
  let source = GKMersenneTwisterRandomSource()
  let defaults = UserDefaults.standard
  
  // MARK: - Lifecycle

    override func viewDidLoad() {
      super.viewDidLoad()
      configureTableView()
      questionManager.shuffleQuestions()
//      shuffleAnswers()
      
      let seed = source.seed
//      defaults.set(0, forKey: "Seed")
      defaults.set(seed, forKey: "Seed")
    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    showQuestion()
  }
  
  // MARK: - Configure UI
  
  private func configureTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
  }
  
  // MARK: - QuizGame
  
  private func showQuestion() {
    
    questionManager.upQuestionNumber()
    let stepProgress = Float(questionManager.questionNumber - 1) / Float(questionManager.questions.count)
    progressView.progress = stepProgress
    
    questionCounterLabel.text = "\(questionManager.questionNumber - 1)/\(questionManager.questions.count)"
    scoreLabel.text = "Score: \(score)"
    questionNameLabel.text = questionManager.currentQuestion?.text ?? ""
    questionNumberLabel.text = "Question \(questionManager.questionNumber - 1)"
    
    tableView.reloadData()
  }
  
  func popToLevelsViewController() {
  guard let viewControllers = self.navigationController?.viewControllers else { return }

  for firstViewController in viewControllers {
    if firstViewController is LevelsViewController {
      self.navigationController?.popToViewController(firstViewController, animated: true)
      break
      }
    }
  }
  
  func pushToResultViewController() {
    let vc = ResultViewController.create(with: questionManager)
    self.navigationController?.pushViewController(vc, animated: true)
    
//    let seed = source.seed
//    let source = GKLinearCongruentialRandomSource(seed: seed)
    
    questionManager.currentQuestion?.answers.shuffle()
  }
  
  private func updateUI() {
    progressView.progress = Float((questionManager.questionNumber - 1)/questionManager.questions.count)
    scoreLabel.text = "Score: \(score)"
    
    if questionManager.questionNumber > questionManager.questions.count {
      let alert = UIAlertController(title: "Awesome",
                                    message: "End of Quiz. Your result is: \(score) out of \(questionManager.questions.count)! Do you want to start over?",
                                    preferredStyle: .alert)
      let restartAction = UIAlertAction(title: "Restart",
                                        style: .default,
                                        handler: { action in
        self.score = 0
        self.questionManager.shuffleQuestions()
        self.showQuestion()
      })
      let mainPageAction = UIAlertAction(title: "Return to main menu",
                                         style: .default,
                                         handler: { action in self.popToLevelsViewController() } )
      let explanationAction = UIAlertAction(title: "Answer explanations",
                                            style: .default,
                                            handler: { action in
                                                self.pushToResultViewController() }
                                            )
      alert.addAction(restartAction)
      alert.addAction(mainPageAction)
      alert.addAction(explanationAction)
      present(alert, animated: true, completion: nil)
    } else {
      showQuestion()    
    }
  }
  

//  1. Create a random source with the plain initializer.
  //  let lcg = GKLinearCongruentialRandomSource(seed: mySeedValue)
//  let source = GKLinearCongruentialRandomSource()
  
//  2. Save off that source's seed value.
//  let seed = source.seed
  
//  let shuffled = lcg.arrayByShufflingObjects(in: array)
  
//  func shuffledN(_ answers: [Answer]) -> [Answer] {
//    let answers = questionManager.currentQuestion?.answers
////    return GKRandomSource.sharedRandom().arrayByShufflingObjects(in: answers!) as! [Answer]
//    return source.arrayByShufflingObjects(in: answers!) as! [Answer]
//  }

//  public func shuffledN() {
//     var answers = questionManager.currentQuestion?.answers
//     GKRandomSource.sharedRandom().arrayByShufflingObjects(in: answers!)
//   }

}
  
  // MARK: - UITableViewDelegate, UITableViewDataSource
  
  extension GameViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        questionManager.currentQuestion?.answers.shuffle()
      
//      questionManager.currentQuestion?.answers.shuffledN()
//      shuffleAnswers()
//      guard let newAnswers = questionManager.currentQuestion?.answers else {return 4}
//      source.arrayByShufflingObjects(in: newAnswers)
  
//      shuffledN(questionManager.currentQuestion!.answers.shuffled())
//      shuffledN(questionManager.currentQuestion!.answers)
      
//      questionManager.currentQuestion?.answers.shuffleM(using: &g)
      
      return questionManager.currentQuestion?.answers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else {
        return UITableViewCell()
      }
      cell.textLabel?.text = questionManager.currentQuestion?.answers[indexPath.row].text

      return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      tableView.deselectRow(at: indexPath, animated: true)
      
      guard let cell = tableView.cellForRow(at: indexPath) as? CustomTableViewCell else { return }
    
      guard let question = questionManager.currentQuestion else { return }
      let answer = question.answers[indexPath.row]
            
      if answer.correct {
        score += 1
        cell.turnGreen()
      } else {
        cell.turnRed()
      }
      
      DispatchQueue.main.asyncAfter(deadline: .now()+1) {
        self.updateUI()
      }
    }
  }

//extension MutableCollection where Self: RandomAccessCollection {
//
////  @inlinable
////    public mutating func shuffleM() {
////      var g = SystemRandomNumberGenerator()
////      shuffle(using: &g)
////    }
//
//  @inlinable
//  public mutating func shuffleM<T>(using generator: inout T) where T: RandomNumberGenerator {
//    var g = SystemRandomNumberGenerator()
//    shuffle(using: &g)
//  }
//}



//extension Array {
//
//  let shuffledReplicate = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: )
//
//    func shuffled(using source: GKRandomSource) -> [Element] {
//        return (self as NSArray).shuffled(using: source) as! [Element]
//    }
//
//}
//let shuffled3 = array.shuffled(using: &g)
  

  
  
  
  



