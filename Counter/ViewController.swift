//
//  ViewController.swift
//  Counter
//
//  Created by Виктор on 14.03.2023.
//

import UIKit

class ViewController: UIViewController {

    var count: Int = 0 {
        didSet {
            updateUI()
        }
    }
    var historyText: String = "" {
        didSet {
            updateUI()
        }
    }
    
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        count = 0
        historyText = ""
    }

    @IBAction func clickPlusButton(_ sender: Any) {
        count += 1
        historyText += "[\(getFormattedDateTime())]: значение изменилось на +1\n"
    }
    
    @IBAction func clickMinusButton(_ sender: Any) {
        if count <= 0 {
            historyText += "[\(getFormattedDateTime())]: попытка уменьшить значение счётчика ниже 0\n"
            return
        }
        count -= 1
        historyText += "[\(getFormattedDateTime())]: значение изменилось на -1\n"
    }
    
    @IBAction func clickResetButton(_ sender: Any) {
        count = 0
        historyText += "[\(getFormattedDateTime())]: значение сброшено\n"
    }
    
    func updateUI() {
        countLabel.text = count.description
        historyTextView.text = historyText
    }
    
    func getFormattedDateTime() -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let date = Date()
        return dateFormat.string(from: date)
    }
}

