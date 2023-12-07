//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var oneBtn: UIButton!
    @IBOutlet weak var twoBtn: UIButton!
    @IBOutlet weak var threeBtn: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle! //True or False
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        sender.backgroundColor = userGotItRight ? UIColor.green : UIColor.red
        
        quizBrain.nextQuestion()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.updateUI()
        }
    }
    
    func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        oneBtn.setTitle(quizBrain.getLabel(index: 0), for: [])
        twoBtn.setTitle(quizBrain.getLabel(index: 1), for: [])
        threeBtn.setTitle(quizBrain.getLabel(index: 2), for: [])
        
        oneBtn.backgroundColor = UIColor.clear
        twoBtn.backgroundColor = UIColor.clear
        threeBtn.backgroundColor = UIColor.clear
    }
    
}

