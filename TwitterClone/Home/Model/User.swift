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


struct User {
    
    
    let name: String
    let username: String
    let bioText: String
    let profileImage: UIImage
    
    
    init(withJSON json: JSON) {
        
        self.name = json["name"].stringValue
        self.username = json["username"].stringValue
        self.bioText = json["bio"].stringValue
        self.profileImage = UIImage()
    }
}
