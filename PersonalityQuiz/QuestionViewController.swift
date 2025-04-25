//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by George McKinney on 4/4/25.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    var questionIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    

    func updateUI(){
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        navigationItem.title = "Question \(questionIndex + 1)"
        
        
        let currentQuestion = questions[questionIndex]
        
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex)/Float(questions.count)
        questionLabel.text = currentQuestion.test
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(answers: currentAnswers)
            //singleStackView.isHidden = false
        case .multiple:
            updateMultipleStack(answers: currentAnswers)
//            multipleStackView.isHidden = false
        case .ranged:
            updateRangeStack(answers: currentAnswers)
//            rangedStackView.isHidden = false
        }
    }
    
    func updateSingleStack(answers: [Answer]){
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultipleStack(answers: [Answer]){
        multipleStackView.isHidden = false
        multiLabel1.text=answers[0].text
        multiLabel2.text=answers[1].text
        multiLabel3.text=answers[2].text
        multiLabel4.text=answers[3].text
    }
    
    func updateRangeStack(answers: [Answer]){
        rangedStackView.isHidden = false
        rangedLabel1.text=answers.first?.text
        rangedLabel2.text=answers.last?.text
    }
    
    var questions: [Question] = [
        Question(
            test: "Which food do you like the most?",
            type: .single,
            answers: [
                Answer(text: "Steak", type: .dog),
                Answer(text: "Fish", type: .cat),
                Answer(text: "Carrots", type: .rabbit),
                Answer(text: "Corn", type: .turtle),
            ]
        ),
        Question(
            test: "Which activities do you enjoy?",
            type: .single,
            answers: [
                Answer(text: "Eating", type: .dog),
                Answer(text: "Sleeping", type: .cat),
                Answer(text: "Cuddling", type: .rabbit),
                Answer(text: "Swimming", type: .turtle),
            ]
        ),
        Question(
            test: "How much do you enjoy car rides?",
            type: .single,
            answers: [
                Answer(text: "I love them", type: .dog),
                Answer(text: "I dislike them", type: .cat),
                Answer(text: "I get a little nervous", type: .rabbit),
                Answer(text: "I barely notice them", type: .turtle),
            ]
        )
    ]

}
