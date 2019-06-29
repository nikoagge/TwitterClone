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
    
    
    let whiteBackgroundView: UIView = {
        
        let wbv = UIView()
        wbv.backgroundColor = .white
        
        return wbv
    }()
    
    
    override func setupViews() {
        
        super.setupViews()
        
        addSubview(whiteBackgroundView)
        addSubview(textLabel)
        
        whiteBackgroundView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        textLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
