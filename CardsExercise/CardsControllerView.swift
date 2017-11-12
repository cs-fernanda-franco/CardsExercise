//
//  CardsControllerView.swift
//  CardsExercise
//
//  Created by Fernanda Bezerra on 12/11/17.
//  Copyright © 2017 Fernanda Bezerra. All rights reserved.
//

import UIKit
import SnapKit

final class CardsControllerView: UIView {
    
    fileprivate lazy var actionsTab: ActionsTabView = {
        let view = ActionsTabView(delegate: nil)
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardsControllerView: CodeView {
    func buildViewHierarchy() {
        addSubview(actionsTab)
        
    }
    
    func buildConstraints() {
        actionsTab.snp.makeConstraints { make in
            make.right.left.bottom.equalTo(self)
            make.height.equalTo(50)
        }
        
    }
    
    func configure() {
        backgroundColor = .white
    }
    
    
}
