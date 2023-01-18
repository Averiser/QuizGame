//
//  TableViewController.swift
//  QuizGame
//
//  Created by MyMacBook on 21.11.2022.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
  
  var questions: [Question]!

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
      return questions.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
      

        return cell
    }



}
