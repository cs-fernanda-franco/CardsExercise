//
//  ActionsTabViewSpec.swift
//  CardsExerciseTests
//
//  Created by Fernanda Bezerra on 12/11/17.
//  Copyright © 2017 Fernanda Bezerra. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
@testable import CardsExercise

class ActionsTabViewDelegateMock: ActionsTabViewDelegate {
    
    var filterByVisaWasCalled = false
    var filterByMasterWasCalled = false
    var resetView = false
    var deleteAll = false
    
    func filterByVisa() {
        filterByVisaWasCalled = true
    }
    
    func filterByMaster() {
        filterByMasterWasCalled = true
    }
    
    func reset() {
        resetView = true
    }
    
    func deleteAllCards() {
        deleteAll = true
    }
    
    
}

class ActionsTabViewSpec: QuickSpec {
    override func spec() {
        describe("the ActionsTabView") {
            var sut: ActionsTabView!
            var mock: ActionsTabViewDelegateMock!
            
            beforeEach {
                mock = ActionsTabViewDelegateMock()
                sut = ActionsTabView(delegate: mock)
                sut.frame = CGRect(x: 0, y: 0, width: 320, height: 50)
            }
            
            it("should not be nil") {
                expect(sut).toNot(beNil())
            }
           
            describe("Look and fell") {
                it("should have the expected look") {
                    expect(sut) == snapshot("ActionsTabViewComponent")
                }
            }
            
            describe("actions") {
                
                it("should delegate filterByVisa Action") {
                    // Act
                    sut.filterbByVisaButton.sendActions(for: .touchUpInside)
                    
                    // assert
                    expect(mock.filterByVisaWasCalled).to(beTrue())
                }
                
                it("should delegate filterByMaster Action") {
                    
                    //act
                    
                    sut.filterbByMasterButton.sendActions(for: .touchUpInside)
                    
                    //assert
                    expect(mock.filterByMasterWasCalled).to(beTrue())
                    
                }
                
                it("should delegate reset Action") {
                    
                    //act
                    
                    sut.resetButton.sendActions(for: .touchUpInside)
                    
                    //assert
                    expect(mock.resetView).to(beTrue())
                    
                }
                
            }
            
            it("should delegate reset Action") {
                
                //act
                
                sut.deleteAllButton.sendActions(for: .touchUpInside)
                
                expect(mock.deleteAll).to(beTrue())
                
            }
            
            
            
        }
    }
}




