//
//  UserFooter.swift
//  TwitterClone
//
//  Created by Nikolas on 28/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import Foundation
import LBTAComponents


class UserFooter: DatasourceCell {
    
    
    let textLabel: UILabel = {
        
        let tl = UILabel()
        tl.text = "Show more"
        tl.font = UIFont.boldSystemFont(ofSize: 16)
        tl.textColor = UIColor(r: 61, g: 167, b: 244)
        
        return tl
    }()
    
    
    override func setupViews() {
        
        super.setupViews()
        
        addSubview(textLabel)
        
        textLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
