//
//  Tweet.swift
//  TwitterClone
//
//  Created by Nikolas on 29/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import Foundation
import SwiftyJSON
import TRON


struct Tweet: JSONDecodable {
    
    
    let user: User
    let message: String
    
    
    init(json: JSON) {
        
        let userJSON = json["user"]
        
        self.user = User(json: userJSON)
        self.message = json["message"].stringValue
    }
}
