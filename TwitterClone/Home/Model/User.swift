//
//  User.swift
//  TwitterClone
//
//  Created by Nikolas on 28/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import Foundation
import UIKit
import SwiftyJSON
import TRON


struct User: JSONDecodable {
    
    
    let name: String
    let username: String
    let bioText: String
    let profileImageURL: String
    
    
    init(json: JSON) {
        
        self.name = json["name"].stringValue
        self.username = json["username"].stringValue
        self.bioText = json["bio"].stringValue
        self.profileImageURL = json["profileImageUrl"].stringValue
    }
}
