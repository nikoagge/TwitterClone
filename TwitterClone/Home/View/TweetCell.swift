//
//  TweetCell.swift
//  TwitterClone
//
//  Created by Nikolas on 29/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import Foundation
import LBTAComponents


class TweetCell: DatasourceCell {
    
    
    let profileImageView: UIImageView = {
        
        let piv = UIImageView()
        piv.backgroundColor = .red
        piv.image = #imageLiteral(resourceName: "profile_image")
        piv.layer.cornerRadius = 5
        piv.clipsToBounds = true
        
        return piv
    }()
    
    
    override func setupViews() {
        
        setupSeparatorLineView()
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
    }
    
    
    func setupSeparatorLineView() {
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
    }
}
