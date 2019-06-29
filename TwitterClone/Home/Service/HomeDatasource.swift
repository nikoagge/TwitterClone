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
    
    
    //let words = ["user1", "user2", "user3", "user4"]
    
    let users: [User] = {
        
        let brianUser = User(name: "Brian", username: "@brianaccount", bioText: "A simple bio text for user Brian.", profileImage: #imageLiteral(resourceName: "profile_image"))
        let rayUser = User(name: "Ray", username: "@rayaccount", bioText: "A simple bio text for user Ray.", profileImage: #imageLiteral(resourceName: "ray_profile_image"))
        
        return [brianUser, rayUser]
    }()
    
    
    override func numberOfItems(_ section: Int) -> Int {
        
        return users.count
    }
    
    
    override func item(_ indexPath: IndexPath) -> Any? {
        
        return users[indexPath.item]
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
