//
//  Question.swift
//  
//
//  Created by George McKinney on 4/4/25.
//

import Foundation

struct Question {
    var text: String
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




//var answers = [String: AnimalType]()




