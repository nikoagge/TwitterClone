//
//  HomeDatasource.swift
//  TwitterClone
//
//  Created by Nikolas on 28/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import Foundation
import LBTAComponents


class HomeDatasource: Datasource {
    
    
    let words = ["user1", "user2", "user3", "user4"]
    
    
    override func numberOfItems(_ section: Int) -> Int {
        
        return words.count
    }
    
    
    override func item(_ indexPath: IndexPath) -> Any? {
        
        return words[indexPath.item]
    }
    
    
    override func cellClasses() -> [DatasourceCell.Type] {
        
        return [UserCell.self]
    }
    
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        
        return [UserHeader.self]
    }
    
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        
        return [UserFooter.self]
    }
}
