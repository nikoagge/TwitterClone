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
    
    
    override var datasourceItem: Any? {
        
        didSet {
            
            guard let tweet = datasourceItem as? Tweet else { return }
            
            let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
            
            let userNameString = "  \(tweet.user.username)"
            attributedText.append(NSAttributedString(string: userNameString, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            
            let range = NSMakeRange(0, attributedText.string.count)
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle ,value: paragraphStyle, range: range)
            attributedText.append(NSAttributedString(string: "\n\(tweet.message)", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)]))
            
            messageTextView.attributedText = attributedText
        }
    }
    
    let profileImageView: UIImageView = {
        
        let piv = UIImageView()
        piv.backgroundColor = .red
        piv.image = #imageLiteral(resourceName: "profile_image")
        piv.layer.cornerRadius = 5
        piv.clipsToBounds = true
        
        return piv
    }()
    
    
    let messageTextView: UITextView = {
        
        let mtv = UITextView()
        mtv.text = "Some sample text"
        
        return mtv
    }()
    
    
    override func setupViews() {
        
        setupSeparatorLineView()
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        addSubview(messageTextView)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        messageTextView.anchor(self.topAnchor, left: profileImageView.rightAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 4, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    
    func setupSeparatorLineView() {
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
    }
}
