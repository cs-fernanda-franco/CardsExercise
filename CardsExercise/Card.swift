//
//  Card.swift
//  CardsExercise
//
//  Created by Fernanda Bezerra on 11/11/17.
//  Copyright © 2017 Fernanda Bezerra. All rights reserved.
//

import Foundation

enum Flags: String {
    case master = "Master"
    case visa = "Visa"
}

struct Card {
    let holderName: String
    let flag: Flags
    let number: String
}

extension Card: Equatable {
    public static func ==(lhs: Card, rhs: Card) -> Bool {
       return lhs.number == rhs.number
    }
    
}
