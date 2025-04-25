//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by George McKinney on 4/4/25.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBSegueAction func showResults(_ coder: NSCoder) -> ResultsViewController? {
        return ResultsViewController(coder: coder)
    }
    //, responses: answersChosen

    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!

    @IBOutlet weak var multipleStackView: UIStackView!

    @IBOutlet var multiSwitch1: UISwitch!
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet var multiSwitch2: UISwitch!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet var multiSwitch3: UISwitch!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet var multiSwitch4: UISwitch!
    @IBOutlet weak var multiLabel4: UILabel!

    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!

    @IBOutlet weak var questionLabel: UITextView!
    @IBOutlet weak var questionProgressView: UIProgressView!
    @IBOutlet weak var questionText: UILabel!
    var questionIndex = 0
    var answersChosen: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }

    @IBAction func singleAnswerButtonpresped(_ sender: UIButton) {

        let currentAnswers = questions[questionIndex].answers
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        nextQuestion()

    }

    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true

        navigationItem.title = "Question \(questionIndex + 1)"

        let currentQuestion = questions[questionIndex]

        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        questionLabel.text = currentQuestion.text
        questionText.text = currentQuestion.text
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

    func updateSingleStack(answers: [Answer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }

    func updateMultipleStack(answers: [Answer]) {
        multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }

    func updateRangeStack(answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }

    func nextQuestion() {
        questionIndex += 1

        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "Results", sender: nil)
        }
    }

    var questions: [Question] = [

        Question(
            text: "Which food do you like the most?",
            type: .single,
            answers: [
                Answer(text: "Steak", type: .dog),
                Answer(text: "Fish", type: .cat),
                Answer(text: "Carrots", type: .rabbit),
                Answer(text: "Corn", type: .turtle),
            ]
        ),
        Question(
            text: "Which activities do you enjoy?",
            type: .single,
            answers: [
                Answer(text: "Eating", type: .dog),
                Answer(text: "Sleeping", type: .cat),
                Answer(text: "Cuddling", type: .rabbit),
                Answer(text: "Swimming", type: .turtle),
            ]
        ),
        Question(
            text: "How much do you enjoy car rides?",
            type: .single,
            answers: [
                Answer(text: "I love them", type: .dog),
                Answer(text: "I dislike them", type: .cat),
                Answer(text: "I get a little nervous", type: .rabbit),
                Answer(text: "I barely notice them", type: .turtle),
            ]
        ),
    ]

}
