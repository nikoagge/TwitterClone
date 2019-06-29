//
//  HomeDatasourceController.swift
//  TwitterClone
//
//  Created by Nikolas on 28/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import Foundation
import LBTAComponents


class HomeDatasourceController: DatasourceController {
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupHomeDatasource()
    }
    
    
    func setupHomeDatasource() {
        
        let homeDatasource = HomeDatasource()
        self.datasource = homeDatasource
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 50)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 50)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //12 is the padding of the profileImageView and the view-screen, 50 is the actual width of profileImageView. Lastly we must also give a little more padding thus second - 12.
        let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
        
        let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
        
        //Because in bioTextView declaration set fontSize of 15, I write following line:
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
        
        if let user = self.datasource?.item(indexPath) as? User {
            
            //Get an estimation of the height of the cell based on user.bioText
            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
        }
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
}
