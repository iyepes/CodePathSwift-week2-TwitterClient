//
//  HCOTwitterUser.swift
//  HCOTwitterClient
//
//  Created by Isabel Yepes on 11/10/14.
//  Copyright (c) 2014 Isabel Yepes. All rights reserved.
//

import UIKit

class HCOTwitterUser: NSObject {
    var name: String?
    var screenName: String?
    var profileImageUrl: String?
    var tagline: String?
    var retrievedUserData: NSDictionary
    
    init(retrievedUserData: NSDictionary){
        self.retrievedUserData = retrievedUserData
        name = retrievedUserData["name"] as? String
        screenName = retrievedUserData["screen_name"] as? String
        profileImageUrl = retrievedUserData["profile_image_url"] as? String
        tagline = retrievedUserData["description"] as? String
    
    }
}
