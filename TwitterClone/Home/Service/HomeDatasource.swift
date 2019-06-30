//
//  HomeDatasource.swift
//  TwitterClone
//
//  Created by Nikolas on 28/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import Foundation
import LBTAComponents
import TRON
import SwiftyJSON


class HomeDatasource: Datasource, JSONDecodable {
    
    
    //let words = ["user1", "user2", "user3", "user4"]
    
//    let users: [User] = {
//
//        let brianUser = User(name: "Brian", username: "@brianaccount", bioText: "A simple bio text for user Brian.", profileImage: #imageLiteral(resourceName: "profile_image"))
//        let rayUser = User(name: "Ray", username: "@rayaccount", bioText: "A simple bio text for user Ray.", profileImage: #imageLiteral(resourceName: "ray_profile_image"))
//        let kindleCourseUser = User(name: "Kindle Course", username: "@kindleCourse", bioText: "Recently released course. Provides some excellent guidance on how to use UITableView and UICollectionView. This course also teaches some basics on Swift language, for example if statements and for loops. An excellent purchase for you.", profileImage: #imageLiteral(resourceName: "kindle_logo"))
//
//        return [brianUser, rayUser]
//    }()
    let users: [User]
    
    
    required init(json: JSON) throws {
        
        print("Now ready to parse JSON: \n", json)
        
        var users = [User]()
        
        let array = json["users"].array
        
        for userJSON in array! {
            
            let name = userJSON["name"].stringValue
            let username = userJSON["username"].stringValue
            let bio = userJSON["bio"].stringValue
            
            let user = User(name: name, username: username, bioText: bio, profileImage: UIImage())
            
            users.append(user)
        }
        
        self.users = users
    }
    
    let tweets: [Tweet] = {
        
        let brianUser = User(name: "Brian", username: "@brianaccount", bioText: "A simple bio text for user Brian.", profileImage: #imageLiteral(resourceName: "profile_image"))
        
        let brianTweet = Tweet(user: brianUser, message: "Welcome to my account. Here you can find tutorials, useful advice about iOS programming and many more. Feel free to ask me anything you want!")
        let anotherBrianTweet = Tweet(user: brianUser, message: "Here is another tweet of me, Brian. Happy to here from you really soon...")
        
        
        return [brianTweet, anotherBrianTweet]
    }()
    
    
    override func numberOfSections() -> Int {
        
        return 2
    }
    
    
    override func numberOfItems(_ section: Int) -> Int {
        
        if section == 1 {
            
            return tweets.count
        }
        
        return users.count
    }
    
    
    override func item(_ indexPath: IndexPath) -> Any? {
        
        if indexPath.section == 1 {
            
            return tweets[indexPath.item]
        }
        
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
