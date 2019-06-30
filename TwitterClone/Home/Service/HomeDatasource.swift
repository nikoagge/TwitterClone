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
    var users: [User]
    var tweets: [Tweet]
    
    
    required init(json: JSON) throws {
        
        print("Now ready to parse JSON: \n", json)
        
        //var users = [User]()
        
        guard let usersJSONArray = json["users"].array, let tweetsJSONArray = json["tweets"].array else { throw NSError(domain: "com.letsbuildthatapp", code: 1, userInfo: [NSLocalizedDescriptionKey: "Parsing JSON was not valid."])}
        
        self.users = usersJSONArray.map{return User(json: $0)}
        
        self.tweets = tweetsJSONArray.map{return Tweet(json: $0)}
        
        self.users = try usersJSONArray.decode()
        self.tweets = try tweetsJSONArray.decode()
    }
//
//    let tweets: [Tweet] = {
//
//        let brianUser = User(name: "Brian", username: "@brianaccount", bioText: "A simple bio text for user Brian.", profileImage: #imageLiteral(resourceName: "profile_image"))
//
//        let brianTweet = Tweet(user: brianUser, message: "Welcome to my account. Here you can find tutorials, useful advice about iOS programming and many more. Feel free to ask me anything you want!")
//        let anotherBrianTweet = Tweet(user: brianUser, message: "Here is another tweet of me, Brian. Happy to here from you really soon...")
//
//
//        return [brianTweet, anotherBrianTweet]
//    }()
    
    
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
