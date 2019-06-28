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
        nl.backgroundColor = .green
        
        return nl
    }()
    
    let profileImageView: UIImageView = {
        
        let piv = UIImageView()
        piv.backgroundColor = .red
        
        return piv
    }()
    
    let userNameLabel: UILabel = {
        
        let unl = UILabel()
        unl.text = "username"
        unl.backgroundColor = .purple
        
        return unl
    }()
    
    let bioTextView: UITextView = {
        
        let btv = UITextView()
        btv.backgroundColor = .yellow
        
        return btv
    }()
    
    let followButton: UIButton = {
        
        let fb = UIButton()
        fb.backgroundColor = .cyan
        
        return fb
    }()
    
    
    override func setupViews() {
        
        super.setupViews()
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(userNameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        userNameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        bioTextView.anchor(userNameLabel.bottomAnchor, left: userNameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        followButton.anchor(self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
    }
}
