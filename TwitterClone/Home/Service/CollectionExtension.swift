//
//  CollectionExtension.swift
//  TwitterClone
//
//  Created by Nikolas on 30/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import Foundation
import SwiftyJSON
import TRON


extension Collection where Iterator.Element == JSON {
    
    
    func decode<T: JSONDecodable>() throws -> [T] {
        
        return try map{try T(json: $0)}
    }
}
