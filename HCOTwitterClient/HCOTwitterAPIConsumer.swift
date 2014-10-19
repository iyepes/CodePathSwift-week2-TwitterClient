//
//  HCOTwitterAPIConsumer.swift
//  HCOTwitterClient
//
//  Created by Isabel Yepes on 11/10/14.
//  Copyright (c) 2014 Isabel Yepes. All rights reserved.
//

import UIKit

let twitterAPIKey = "HK7mIgzC8j4yBArOcruxpZ9Oq"
let twitterAPISecret = "Uujobd1iBcc73oF435j1R4QpmNBx7SWBT0i4xIr6GZiAf18Om4"
let twitterBaseURL = NSURL(string: "https://api.twitter.com")

class HCOTwitterAPIConsumer: BDBOAuth1RequestOperationManager {
   
    var loginCompletion: ((user: HCOTwitterUser?, error: NSError?) -> ())?
    
    class var sharedInstance: HCOTwitterAPIConsumer {
        struct staticClass {
                static let instance = HCOTwitterAPIConsumer(baseURL: twitterBaseURL, consumerKey: twitterAPIKey, consumerSecret: twitterAPISecret)
        }
        return staticClass.instance
    }
    
    func loginWithCompletion(completion: (user: HCOTwitterUser?, error: NSError?) -> ()) {
        loginCompletion = completion
        
        //Token request and get authorization by browser
        HCOTwitterAPIConsumer.sharedInstance.requestSerializer.removeAccessToken()
        HCOTwitterAPIConsumer.sharedInstance.fetchRequestTokenWithPath("oauth/request_token", method: "GET", callbackURL: NSURL(string: "HCOTwitterClientCP://oauth"), scope: nil, success: { (requestToken: BDBOAuthToken!) -> Void in
            println("Got request token")
            var authURL = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)")
            UIApplication.sharedApplication().openURL(authURL)
            }) { (error: NSError!) -> Void in
                println("Failed getting the token")
                self.loginCompletion?(user: nil, error: error)
        }
    }
    
    func openURL(url: NSURL) {
    
        fetchAccessTokenWithPath("oauth/access_token", method: "POST", requestToken: BDBOAuthToken(queryString: url.query),
            success: {
                (accessToken: BDBOAuthToken!) -> Void in
                println("Got the access token")
                HCOTwitterAPIConsumer.sharedInstance.requestSerializer.saveAccessToken(accessToken)
                
                HCOTwitterAPIConsumer.sharedInstance.GET("1.1/account/verify_credentials.json", parameters: nil,
                    success: {
                        (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
                        //println(response)
                        var user = HCOTwitterUser(retrievedUserData: response as NSDictionary)
                        println("user: \(user.name)")
                        self.loginCompletion?(user: user, error: nil)
                    }, failure: {
                        (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                        println("Error with current user")
                        self.loginCompletion?(user: nil, error: error)
                    }
                )
                
                HCOTwitterAPIConsumer.sharedInstance.GET("1.1/statuses/home_timeline.json", parameters: nil,
                    success: {
                        (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
                        //println(response)
                        var tweets = HCOTwitterTweet.tweetsWithArray(response as [NSDictionary])
                        for tweet in tweets {
                            println("text: \(tweet.text), created: \(tweet.createdAt)")
                        }
                    }, failure: {
                        (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                        println("Error with timeline")
                    }
                )
                
            }
            )
            { (error: NSError!) -> Void in
                println("Error accessing token")
                self.loginCompletion?(user: nil, error: error)
        }
    }
    
}
