//
//  CardRepository.swift
//  CardsExercise
//
//  Created by Fernanda Bezerra on 11/11/17.
//  Copyright © 2017 Fernanda Bezerra. All rights reserved.
//

import Foundation

protocol CardService {
    func list() -> [Card]
    func save(card: Card)
    func remove(card: Card)
    func update(card: Card, to newCard: Card)
    func deleteAll()
}

class CardRepository: CardService {
    
    private var cards: [Card] = []
    
    func list() -> [Card] {
        return cards
    }
    
    func save(card: Card) {
        cards.append(card)
    }
    
    func remove(card: Card) {
        if let index = cards.index(of: card) {
            cards.remove(at: index)
        }
    }
    
    func update(card: Card, to newCard: Card) {
        if !cards.contains(card) {
            return
        }
        remove(card: card)
        save(card: newCard)
    }
    
    func deleteAll() {
        cards = []
    }
}
