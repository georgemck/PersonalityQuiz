//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by George McKinney on 4/4/25.
//

import UIKit

class ResultsViewController: UIViewController {
    var responses: [Answer] = []
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var resultDescriptionLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var shareImageView: UIImageView!
    @IBOutlet weak var shareLabel: UILabel!
    
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
    }
    
    func calculatePersonalityResult() {
//        let frdequencyOfAnswers = responses.reduce(into: [:]) { (counts, answers) in
//            counts[answer.type, default:0] += 1
//            
//        }
        let frequencyOfAnswers = responses.reduce(into: [AnimalType:Int]()){
            (counts,answers) in
            if let existingCount = counts[answers.type] {
                counts[answers.type] = existingCount + 1
            } else {
                counts[answers.type] = 1
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
