//
//  WordCell.swift
//  TwitterClone
//
//  Created by Nikolas on 28/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import UIKit


class WordCell: UICollectionViewCell {

    
    let wordLabel: UILabel = {
        
        let wl = UILabel()
        wl.text = "Test"
        wl.translatesAutoresizingMaskIntoConstraints = false
        
        return wl
    }()
    
    
    //This gets called when a cell is dequeued
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupViews()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews() {
        
        backgroundColor = .yellow
        
        addSubview(wordLabel)
        
        //Set x, y, width and height constraints for wordLabel
        wordLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        wordLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        wordLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        wordLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
