//
//  UserHeader.swift
//  TwitterClone
//
//  Created by Nikolas on 28/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import Foundation
import LBTAComponents


class UserHeader: DatasourceCell {
    
    
    let textLabel: UILabel = {
        
        let tl = UILabel()
        tl.text = "Who to follow"
        tl.font = UIFont.boldSystemFont(ofSize: 16)
        
        return tl
    }()
    
    
    override func setupViews() {
        
        super.setupViews()
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        addSubview(textLabel)
        
        textLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
