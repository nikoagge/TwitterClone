//
//  UserCell.swift
//  TwitterClone
//
//  Created by Nikolas on 28/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import Foundation
import LBTAComponents


class UserCell: DatasourceCell {
    
    
    override var datasourceItem: Any? {
        
        didSet {
            
            nameLabel.text = datasourceItem as? String
        }
    }
    
    let nameLabel: UILabel = {
        
        let nl = UILabel()
        nl.text = "Test"
        
        return nl
    }()
    
    
    override func setupViews() {
        
        super.setupViews()
        
        backgroundColor = .yellow
        
        addSubview(nameLabel)
        
        nameLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
