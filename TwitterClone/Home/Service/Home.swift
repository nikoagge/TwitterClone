//
//  Home.swift
//  TwitterClone
//
//  Created by Nikolas on 29/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import Foundation
import TRON
import SwiftyJSON
import UIKit


class Home: JSONDecodable {
    
    
    let users: [User]
    
    
    required init(json: JSON) throws {
        
        print("Now ready to parse JSON: \n", json)
        
        var users = [User]()
        
        let array = json["users"].array
        
        for userJSON in array! {
            
            let name = userJSON["name"].stringValue
            let username = userJSON["username"].stringValue
            let bio = userJSON["bio"].stringValue
            
            //let user = User(name: name, username: username, bioText: bio, profileImage: UIImage())
            
            //users.append(user)
        }
        
        self.users = users
    }
}
