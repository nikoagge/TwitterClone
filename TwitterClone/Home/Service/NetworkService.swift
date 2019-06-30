//
//  NetworkService.swift
//  TwitterClone
//
//  Created by Nikolas on 30/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import Foundation
import TRON
import SwiftyJSON


struct NetworkService {
    
    
     let tronBaseURL = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    
    static let sharedInstance = NetworkService()
    
    
    func fetchHomeFeed(withCompletion completion: @escaping (HomeDatasource?, Error?) -> ()) {
        
        //Start JSON fetch.
        let request: APIRequest<HomeDatasource, JSONError> = tronBaseURL.swiftyJSON.request("/twitter/home")
        
        request.perform(withSuccess: { (homeDatasource) in
            
            //self.datasource = homeDatasource
            completion(homeDatasource, nil)
        }) { (error) in
            
            print("Failed to fetch JSON: ", error)
            completion(nil, error)
        }
    }
}
