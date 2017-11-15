//
//  CardsDataSourceSpec.swift
//  CardsExerciseTests
//
//  Created by Fernanda Bezerra on 15/11/17.
//  Copyright © 2017 Fernanda Bezerra. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
@testable import CardsExercise

final class CardsDataSourceSpec: QuickSpec {
    
    override func spec() {
        describe("Cards DataSource") {
            
            var cardsData: CardsDataSource!
            var tableView: UITableView!
            var items: [Card]!
            
            beforeEach {
                let frame = CGRect(x: 0, y: 0, width: 320, height: 500)
                tableView = UITableView(frame: frame)
                
                items = [
                    Card(holderName: "Fer", flag: .visa, number: "1234"),
                    Card(holderName: "Thiago", flag: .master, number: "4567")
                ]
                
                cardsData = CardsDataSource(items: items, tableView: tableView)
                
                //act1
                tableView.dataSource = cardsData
                tableView.reloadData()
            }
            
            it("Should have a DataSource") {
                //prepare
                

                
                //assert
                expect(tableView.dataSource).toNot(beNil())
            }
            it("Should have a expected number of rows") {
                
                //act
                let count = cardsData.tableView(tableView, numberOfRowsInSection: 0)
                
                //assert
                expect(count).to(equal(items.count))
                
            }
            it("Should have the expected type of cell") {
                
                //act
                
                let indexPath = IndexPath(row: 0, section: 0)
                
                let cell = cardsData.tableView(tableView, cellForRowAt: indexPath)
                
                //assert
                expect(cell).to(beAKindOf(CardTableViewCell.self))
                
            }
            
            it("Should have the expected row height") {
                //act
                
                let height = tableView.rowHeight
                
                //assert
                let expected = CGFloat(80)
                expect(height).to(equal(expected))
            }
            
            it("Should have the expected UI") {
               expect(tableView) == snapshot("CardsTableView")
            }

            
        }
    }
    
}
