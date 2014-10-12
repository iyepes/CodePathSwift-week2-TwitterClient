//
//  HCOTwitterTweet.swift
//  HCOTwitterClient
//
//  Created by Isabel Yepes on 11/10/14.
//  Copyright (c) 2014 Isabel Yepes. All rights reserved.
//

import UIKit

class HCOTwitterTweet: NSObject {
    var user: HCOTwitterUser?
    var text: String?
    var createdAtString: String?
    var createdAt: NSDate?
    
    init (retrievedTweet: NSDictionary) {
        user = HCOTwitterUser(retrievedUserData: retrievedTweet["user"] as NSDictionary)
        text = retrievedTweet["text"] as String?
        createdAtString = retrievedTweet["created_at"] as String?
        var formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        createdAt = formatter.dateFromString(createdAtString!)
        
    }
    
    class func tweetsWithArray(arrayOfTweets: [NSDictionary]) -> [HCOTwitterTweet] {
        var tweets = [HCOTwitterTweet]()
        for retrievedTweet in arrayOfTweets {
            tweets.append(HCOTwitterTweet(retrievedTweet: retrievedTweet))
        }
        return tweets
    }
}
