//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var ProgressBar: UIProgressView!
    @IBOutlet weak var TrueButton: UIButton!
    @IBOutlet weak var FalseButton: UIButton!
    @IBOutlet weak var QuestionNumber: UILabel!
    
    var quizzBrain = QuizzBrain()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        QuestionLabel.text = quizzBrain.quizzArray[quizzBrain.QuestionNo].QuestionText;
        QuestionNumber.text = "QUESTION NO " + String(quizzBrain.QuestionNo+1)
    }

    @IBAction func ButtonPress(_ sender: UIButton) {
        
        let UserAnswer = sender.currentTitle!;
        self.quizzBrain.checkUserAnswer(userAnswer: UserAnswer,sender: sender)
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(moveNext), userInfo: ["sender": sender], repeats: false)
    }
    
    @objc func moveNext(_ timer: Timer) {
        
        guard let userInfo = timer.userInfo as? [String: Any],
              let sender = userInfo["sender"] as? UIButton else {
            return
        }
        
        quizzBrain.UpdateQuestion(sender: sender, QuestionLabel: QuestionLabel, ProgressBar: ProgressBar, TrueButton: TrueButton, FalseButton: FalseButton, QuestionNumber: QuestionNumber)
    }
}

