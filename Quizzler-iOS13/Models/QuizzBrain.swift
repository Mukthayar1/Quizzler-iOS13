//
//  QuizzBrain.swift
//  Quizzler-iOS13
//
//  Created by Muhammad Mukhtayar on 13/03/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct QuizzBrain {
    let quizzArray = [
        Questions(quest: "Which is the largest organ in the human body?", option: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Questions(quest: "Five dollars is worth how many nickels?", option: ["25", "50", "100"], correctAnswer: "100"),
        Questions(quest: "What do the letters in the GMT time zone stand for?", option: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Questions(quest: "What is the French word for 'hat'?", option: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Questions(quest: "In past times, what would a gentleman keep in his fob pocket?", option: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Questions(quest: "How would one say goodbye in Spanish?", option: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Questions(quest: "Which of these colours is NOT featured in the logo for Google?", option: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Questions(quest: "What alcoholic drink is made from molasses?", option: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Questions(quest: "What type of animal was Harambe?", option: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Questions(quest: "Where is Tasmania located?", option: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")

        
    ];
    
    var QuestionNo = 0;
    var CorrectAnswer = 0;
    
   mutating func checkUserAnswer(userAnswer: String,sender: UIButton,TotalScrores:UILabel) {
        if(userAnswer == quizzArray[QuestionNo].RightAnswer){
            sender.backgroundColor = UIColor.green;
            self.CorrectAnswer += 1;
            TotalScrores.text = "Total Score = \(CorrectAnswer*10)"
        }
        else {
            sender.backgroundColor = UIColor.red
        }
    }
    
    func setTimeout(_ delayInSeconds: Double, _ block: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delayInSeconds, execute: block)
    }
    
    func updateProgressBar(ProgressBar: UIProgressView) {
        let progress = Float(QuestionNo) / Float( quizzArray.count) * 100
        ProgressBar.setProgress(progress / 100, animated: true)
    }
    
    mutating func UpdateQuestion(sender: UIButton,QuestionLabel: UILabel,ProgressBar: UIProgressView,TrueButton: UIButton!,FalseButton: UIButton,QuestionNumber: UILabel,TotalScrores:UILabel) {
        TrueButton.backgroundColor = UIColor.clear;
        FalseButton.backgroundColor = UIColor.clear;
        QuestionNumber.text = "QUESTION NO " + String(self.QuestionNo+1)
        
        //CHANGE QUESTION
        if self.QuestionNo + 1 < self.quizzArray.count {
            QuestionLabel.text = self.quizzArray[self.QuestionNo + 1].QuestionText
            self.QuestionNo += 1
        } else {
            QuestionLabel.text = self.quizzArray[0].QuestionText
            self.QuestionNo = 0
            TotalScrores.text = ""
        }
        
        updateProgressBar(ProgressBar:ProgressBar)
    }
}
