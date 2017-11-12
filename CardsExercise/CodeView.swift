//
//  CodeView.swift
//  CardsExercise
//
//  Created by Fernanda Bezerra on 12/11/17.
//  Copyright © 2017 Fernanda Bezerra. All rights reserved.
//

import Foundation

protocol CodeView {
    func buildViewHierarchy()
    func buildConstraints()
    func configure()
    func setup()
}

extension CodeView {
    func setup() {
        buildViewHierarchy()
        buildConstraints()
        configure()
    }
    
    func configure() {
        
    }
}
