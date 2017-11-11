//
//  ViewControllerTest.swift
//  CardsExerciseTests
//
//  Created by Fernanda Bezerra on 11/11/17.
//  Copyright © 2017 Fernanda Bezerra. All rights reserved.
//

import XCTest
@testable import CardsExercise

class ViewControllerTest: XCTestCase {
    
    var controller: ViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateInitialViewController() as! ViewController
        
        _ = controller.view
        
        controller.cards = [
            Card(holderName: "primeiro", flag: "visa"),
            Card(holderName: "segundo", flag: "master"),
            Card(holderName: "terceiro", flag: "master")
        ]
        
        // Act
        controller.viewDidLoad()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldHaveExpectedRowCountAfterViewDidLoad() {
        
        // Assert
        let count = controller.tableView.numberOfRows(inSection: 0)
        XCTAssert(count == 3)
    }
    
    func testShouldHaveExpectedRowCountAfterFilterByVisa() {

        //Act
        
        controller.filterByVisaFlag()
        
        //Assert
        
        let count = controller.tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(count, 1)
    }
    
    func testShouldHaveExpectedRowCountAfterFilterByMaster() {
        
        controller.filterByMasterFlag()
        
        let count = controller.tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(count, 2)
        
    }
    
    func testShouldHaveExpectedRowCountAfterReset() {
        
        //Act
        
        controller.reset()
        
        //Assert
        
        let count = controller.tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(count, 3)
        
    }
    
    func testShouldHaveExpectedRowCountAfterDeleteAll() {
        
        controller.deleteAll()
        
        let count = controller.tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(count, 0)
        
    }
    
    func testShoulHaveExpectedAllCardsAfterFilterCards() {
        
        let cards = controller.filterCards()
        
        let count = cards.count
        XCTAssertEqual(count, 3)
    }
    
    func testShouldHaveExpectedCardsFilterByMaster() {
        
        controller.filterBy = "master"
        
        let count = controller.filterCards().count
        
        XCTAssertEqual(count, 2)
        
        
    }
    
    
    
    
    
    
    
    
    
}
