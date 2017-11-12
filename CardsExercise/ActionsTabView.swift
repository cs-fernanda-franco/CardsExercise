//
//  ActionsTabView.swift
//  CardsExercise
//
//  Created by Fernanda Bezerra on 12/11/17.
//  Copyright © 2017 Fernanda Bezerra. All rights reserved.
//

import UIKit
import SnapKit

protocol ActionsTabViewDelegate: class {
    func filterByVisa()
    func filterByMaster()
    func reset()
    func deleteAllCards()
}

final class ActionsTabView: UIView {
    
    fileprivate lazy var container: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.distribution = .fillEqually
        return view
    }()
    
    fileprivate(set) lazy var filterbByVisaButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Visa", for: .normal)
        view.accessibilityLabel = "Visa"
        view.setTitleColor(.black, for: .normal)
        view.addTarget(self, action: #selector(didCLickFilterByVisaButton), for: .touchUpInside)
        return view
    }()
    
    fileprivate(set) lazy var filterbByMasterButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Master", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.addTarget(self, action: #selector(didCLickFilterByMasterButton), for: .touchUpInside)
        return view
    }()
    
    fileprivate(set) lazy var resetButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Reset", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.addTarget(self, action: #selector(didCLickResetButton), for: .touchUpInside)
        return view
    }()
    
    fileprivate(set)lazy var deleteAllButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Delete All", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.addTarget(self, action: #selector(didCLickDeleteAllButton), for: .touchUpInside)
        return view
    }()
    
    weak var delegate: ActionsTabViewDelegate?
    
    init(delegate: ActionsTabViewDelegate?) {
        self.delegate = delegate
        super.init(frame: .zero)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ActionsTabView {
    @objc
    fileprivate func didCLickFilterByVisaButton() {
        delegate?.filterByVisa()
    }
    
    @objc
    fileprivate func didCLickFilterByMasterButton() {
        delegate?.filterByMaster()
    }
    
    @objc
    fileprivate func didCLickResetButton() {
        delegate?.reset()
    }
    
    @objc
    fileprivate func didCLickDeleteAllButton() {
        delegate?.deleteAllCards()
        
    }
    
    
}

extension ActionsTabView: CodeView {
    
    func buildViewHierarchy() {
        container.addArrangedSubview(filterbByVisaButton)
        container.addArrangedSubview(filterbByMasterButton)
        container.addArrangedSubview(resetButton)
        container.addArrangedSubview(deleteAllButton)
        
        addSubview(container)
    }
    
    func buildConstraints() {
        container.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
    }
    
    func configure() {
        backgroundColor = .white
    }
    
}
