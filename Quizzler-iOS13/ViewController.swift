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
    
    
    
    
    let quizzArray = [
        Questions(q: "A slug's blood is green.", a: "True"),
        Questions(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Questions(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Questions(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Questions(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Questions(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Questions(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Questions(q: "Google was originally called 'Backrub'.", a: "True"),
        Questions(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Questions(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Questions(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Questions(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
 
    ];
    
    var QuestionNo = 0;
        
    override func viewDidLoad() {
        super.viewDidLoad()
        QuestionLabel.text = quizzArray[QuestionNo].QuestionText;
        QuestionNumber.text = "QUESTION NO " + String(QuestionNo+1)
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "WRONG ANSWER", message: "YOU SELECTED WRONG ANSWER", preferredStyle: .alert)

            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                print("OK button pressed")
            }
            alertController.addAction(okAction)

            present(alertController, animated: true, completion: nil)
        }

    @IBAction func ButtonPress(_ sender: UIButton) {
        
        let UserAnswer = sender.currentTitle;
        let CorrectAnswer = quizzArray[QuestionNo].RightAnswer;
        
        print("USER ANSWER ====> ",UserAnswer!)
        print("CORRECT ANSWER ====>",CorrectAnswer)
        
        //CHECK QUESTION
        if UserAnswer == CorrectAnswer {
            sender.backgroundColor = UIColor.green
        }else {
            sender.backgroundColor = UIColor.red
        }
      
        
        func setTimeout(_ delayInSeconds: Double, _ block: @escaping () -> Void) {
            DispatchQueue.main.asyncAfter(deadline: .now() + delayInSeconds, execute: block)
        }
        
        func updateProgressBar() {
               let progress = Float(QuestionNo) / Float(quizzArray.count) * 100
               ProgressBar.setProgress(progress / 100, animated: true)
           }

        func greetAfterDelay() {
            setTimeout(0.2) {
                self.TrueButton.backgroundColor = UIColor.clear;
                self.FalseButton.backgroundColor = UIColor.clear;
                
                self.QuestionNumber.text = "QUESTION NO " + String(self.QuestionNo+1)
                
                //CHANGE QUESTION
                if self.QuestionNo + 1 < self.quizzArray.count {
                    self.QuestionLabel.text = self.quizzArray[self.QuestionNo+1].QuestionText
                    self.QuestionNo += 1
                }else{
                    self.QuestionLabel.text = self.quizzArray[0].QuestionText
                    self.QuestionNo = 0
                }
                
                
                
                
                //UPDATE PROGRESS BAR
                updateProgressBar()

            }
        }

        greetAfterDelay()
        
    }
    
}

