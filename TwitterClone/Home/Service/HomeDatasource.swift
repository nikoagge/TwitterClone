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
        let kindleCourseUser = User(name: "Kindle Course", username: "@kindleCourse", bioText: "Recently released course. Provides some excellent guidance on how to use UITableView and UICollectionView. This course also teaches some basics on Swift language, for example if statements and for loops. An excellent purchase for you.", profileImage: #imageLiteral(resourceName: "kindle_logo"))
        
        return [brianUser, rayUser]
    }()
    
    let tweets = ["tweet1", "tweet2"]
    
    
    override func numberOfSections() -> Int {
        
        return 2
    }
    
    
    override func numberOfItems(_ section: Int) -> Int {
        
        if section == 1 {
            
            return 1
        }
        
        return users.count
    }
    
    
    override func item(_ indexPath: IndexPath) -> Any? {
        
        return users[indexPath.item]
    }
    
    
    override func cellClasses() -> [DatasourceCell.Type] {
        
        return [UserCell.self, TweetCell.self]
    }
    
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        
        return [UserHeader.self]
    }
    
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        
        return [UserFooter.self]
    }
}
