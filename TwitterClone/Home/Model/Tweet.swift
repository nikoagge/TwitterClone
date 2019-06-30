//
//  Tweet.swift
//  TwitterClone
//
//  Created by Nikolas on 29/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import Foundation
import SwiftyJSON


struct Tweet {
    
    
    let user: User
    let message: String
    
    
    init(withJSON json: JSON) {
        
        let userJSON = json["user"]
        
        self.user = User(withJSON: userJSON)
        self.message = json["message"].stringValue
    }
}
