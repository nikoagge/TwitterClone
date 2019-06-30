//
//  JSONError.swift
//  TwitterClone
//
//  Created by Nikolas on 29/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import Foundation
import TRON
import SwiftyJSON


class JSONError: JSONDecodable {
    
    
    required init(json: JSON) throws {
        
        print("JSON error")
    }
}
