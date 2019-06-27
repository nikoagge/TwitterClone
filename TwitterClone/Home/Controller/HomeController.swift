//
//  HomeController.swift
//  TwitterClone
//
//  Created by Nikolas on 27/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import UIKit


class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    let collectionViewCellIdentifier = "collectionViewCellId"
    let collectionViewHeaderIdentifier = "collectionViewHeaderId"
    let collectionViewFooterIdentifier = "collectionViewFooterId"
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupCollectionView()
    }
    
    
    func setupCollectionView() {
        
        collectionView.backgroundColor = .white
        collectionView.register(WordCell.self, forCellWithReuseIdentifier: collectionViewCellIdentifier)
        collectionView.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: collectionViewHeaderIdentifier)
        collectionView.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: collectionViewFooterIdentifier)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 4
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellIdentifier, for: indexPath)
        
        return collectionViewCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 50)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: collectionViewHeaderIdentifier, for: indexPath)
            header.backgroundColor = .blue
            
            return header
        } else {
            
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: collectionViewFooterIdentifier, for: indexPath)
            footer.backgroundColor = .green
            
            return footer
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 50)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 100)
    }
}

