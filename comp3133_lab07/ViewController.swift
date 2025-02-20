//
//  ViewController.swift
//  comp3133_lab07
//
//  Created by Berlean Gregori on 2025-02-14.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var timesTable: [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        guard let text = numberTextField.text, let number = Int(text) else { return }
        timesTable = (1...10).map { $0 * number }
        tableView.reloadData()
    }

    // MARK: - Table View Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timesTable.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = "\(indexPath.row + 1) x \(numberTextField.text ?? "0") = \(timesTable[indexPath.row])"
        return cell
    }
}


