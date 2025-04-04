//
//  Question.swift
//  
//
//  Created by George McKinney on 4/4/25.
//

import Foundation

struct Question {
    var test: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: Character {
    case cat = "🐈", dog = "🐶", turtle = "🐢", rabbit = "🐰"
    
    var definition: String {
        switch self {
        case .dog:
            return "You are incredibly outgoing."
        case .cat:
            return "You enjoy doing things on your own terms."
        case .turtle:
            return "You are wise beyond your years."
        case .rabbit:
            return "You love everything that's soft."
        }
    }
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

//var answers = [String: AnimalType]()




