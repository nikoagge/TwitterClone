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
            
            guard let user = datasourceItem as? User else { return }
            
            nameLabel.text = user.name
            userNameLabel.text = user.username
            bioTextView.text = user.bioText
            profileImageView.image = user.profileImage
        }
    }
    
    let nameLabel: UILabel = {
        
        let nl = UILabel()
        nl.text = "Brian"
        nl.font = UIFont.boldSystemFont(ofSize: 16)
        
        return nl
    }()
    
    let profileImageView: UIImageView = {
        
        let piv = UIImageView()
        piv.backgroundColor = .red
        piv.image = #imageLiteral(resourceName: "profile_image")
        piv.layer.cornerRadius = 5
        piv.clipsToBounds = true
        
        return piv
    }()
    
    let userNameLabel: UILabel = {
        
        let unl = UILabel()
        unl.text = "@brianapps"
        unl.font = UIFont.boldSystemFont(ofSize: 14)
        unl.textColor = UIColor(r: 130, g: 130, b: 130)
        
        return unl
    }()
    
    let bioTextView: UITextView = {
        
        let btv = UITextView()
        btv.text = "iPhone, iPad and iOS community. Come with us to learn how to build iOS apps."
        btv.font = UIFont.boldSystemFont(ofSize: 15)
        btv.backgroundColor = .clear
        
        return btv
    }()
    
    let followButton: UIButton = {
        
        let fb = UIButton()
        fb.layer.cornerRadius = 5
        fb.layer.borderColor = UIColor(r: 61, g: 167, b: 244).cgColor
        fb.layer.borderWidth = 1
        fb.setTitle("Follow", for: .normal)
        fb.setTitleColor(UIColor(r: 61, g: 167, b: 244), for: .normal)
        fb.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        fb.setImage(#imageLiteral(resourceName: "follow"), for: .normal)
        fb.imageView?.contentMode = .scaleAspectFit
        fb.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        
        return fb
    }()
    
    
    override func setupViews() {
        
        super.setupViews()
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(userNameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        userNameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        bioTextView.anchor(userNameLabel.bottomAnchor, left: userNameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        followButton.anchor(self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
    }
}
