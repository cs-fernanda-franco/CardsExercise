//
//  CardsDataSource.swift
//  CardsExercise
//
//  Created by Fernanda Bezerra on 15/11/17.
//  Copyright © 2017 Fernanda Bezerra. All rights reserved.
//

import UIKit
import Reusable

final class CardsDataSource: NSObject, UITableViewDataSource {
    
    let items: [Card]
    
    init(items: [Card], tableView: UITableView) {
        self.items = items
        super.init()
        registerCells(in: tableView)
    }
    
    func registerCells(in tableView: UITableView) {
        tableView.register(cellType: CardTableViewCell.self)
        tableView.rowHeight = 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: CardTableViewCell.self)
        
        return cell
    }
    
    
    
    
}
