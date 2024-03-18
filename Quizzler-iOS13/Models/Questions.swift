//
//  Questions.swift
//  Quizzler-iOS13
//
//  Created by Muhammad Mukhtayar on 11/03/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct Questions {
    
    let QuestionText : String;
    let Options : [String];
    let RightAnswer : String;
    
    init(quest : String , option : [String] , correctAnswer:String) {
        QuestionText = quest
        Options = option
        RightAnswer = correctAnswer
    }
}
