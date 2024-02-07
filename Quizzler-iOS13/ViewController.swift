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
    
    let quizzArray = [
   [ "4 + 5 = 10 ?","False"],
   ["4 * 5 = 20 ?","True"],
   [ "4 - 5 = 0 ?","True"],
    ]
    
    var QuestionNo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        QuestionLabel.text = quizzArray[QuestionNo][0]
    }

    @IBAction func ButtonPress(_ sender: UIButton) {
        
        let UserAnswer = sender.currentTitle;
        let CorrectAnswer = quizzArray[QuestionNo][1];
        
        print(UserAnswer!)
        print(CorrectAnswer)
        
        if UserAnswer == CorrectAnswer {
            if QuestionNo + 1 < quizzArray.count {
                QuestionLabel.text = quizzArray[QuestionNo+1][0]
                QuestionNo += 1
            }else{
                QuestionLabel.text = quizzArray[0][0]
                QuestionNo = 1
            }
        }
      

        
        
    }
    
}

