//
//  CardsViewController.swift
//  CardsExercise
//
//  Created by Fernanda Bezerra on 12/11/17.
//  Copyright © 2017 Fernanda Bezerra. All rights reserved.
//

import UIKit

final class CardsViewController: UIViewController {
    
    let controllerView = CardsControllerView()
    
    override func loadView() {
        self.view = controllerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    required init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
