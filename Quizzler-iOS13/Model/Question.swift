//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Alan Josue Rodriguez Gomez on 06/12/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation


struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], c: String) {
        self.text = q
        self.answer = a
        self.correctAnswer = c
    }
}
