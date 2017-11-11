//
//  ViewController.swift
//  CardsExercise
//
//  Created by Fernanda Bezerra on 11/11/17.
//  Copyright © 2017 Fernanda Bezerra. All rights reserved.
//

import UIKit

struct Card {
    let holderName: String
    let flag: String
}

class ViewController: UIViewController, UITableViewDataSource {
    
    var cards: [Card] = [
        Card(holderName: "Fernanda", flag: "master"),
        Card(holderName: "Thiago", flag: "visa"),
        Card(holderName: "Jose", flag: "master")
    ]
    
    
    
    var filterBy: String? {
        didSet{
            self.tableView.reloadData()
        }
    }

    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filterCards().count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardTableViewCell", for: indexPath) as? CardTableViewCell
        
        let card = filterCards()[indexPath.row]
        
        cell?.flag.text = card.flag
        cell?.holderName.text = card.holderName
        
        return cell ?? UITableViewCell()
    }
    
    func filterCards() -> [Card] {
        if let filter = filterBy {
            return cards.filter { $0.flag == filter }
        } else {
            return cards
        }
    }
    
    
    @IBAction func filterByVisaFlag() {
        filterBy = "visa"
        
    }
    
    @IBAction func filterByMasterFlag() {
        filterBy = "master"
    }
    
    @IBAction func deleteAll() {
        cards = []
        tableView.reloadData()
        
    }

    @IBAction func reset() {
        
        filterBy = nil
        
    }
    


}

