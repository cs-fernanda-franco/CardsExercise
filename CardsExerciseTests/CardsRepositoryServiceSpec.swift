//
//  CardsRepositoryService.swift
//  CardsExerciseTests
//
//  Created by Fernanda Bezerra on 11/11/17.
//  Copyright © 2017 Fernanda Bezerra. All rights reserved.
//

import Quick
import Nimble
@testable import CardsExercise

class CardsRepositoryServiceSpec: QuickSpec {
    override func spec() {
        describe("the CardsRepositoryService") {
            var sut: CardRepository!
            var card: Card!
            
            beforeEach {
                sut = CardRepository()
                card = Card(holderName: "Fer", flag: .master, number: "1234")
                
            }
            
            it("Should return a list of cards") {
                let list = sut.list()
                
                expect(list.count).to(equal(0))
            }
            
            it("Should save a card") {
                 //Prepare
                
                
                //Act
                
                sut.save(card: card)
                
                //Assert
                
                let list = sut.list()
                
                expect(list.count).to(equal(1))
                
            }
            
            it("Should remove a card") {
                
                //prepare
                sut.save(card: card)
                
                //act
                sut.remove(card: card)
                //Assert
                let list = sut.list()
                expect(list.count).to(equal(0))
            }
            
            it("Should update a card") {
                
                //prepare
                sut.save(card: card)
                let newCard = Card(holderName: card.holderName,
                                   flag: .visa,
                                   number: card.number)
                
                //act
                sut.update(card: card, to: newCard)
                
                //assert
                let uptadedCard = sut.list().first!
                expect(uptadedCard.flag).to(equal(Flags.visa))
                
                
            }
            
            it("Should delete all cards") {
                
                //prepare
                let otherCard = Card(holderName: "Thiago", flag: .visa, number: "5678")
                sut.save(card: card)
                sut.save(card: otherCard)
                
                //act
                sut.deleteAll()
                
                //assert
                let list = sut.list()
                expect(list.count).to(equal(0))
                
            }
            
            
        }
    }
}
