//
//  ViewController.swift
//  HCOTwitterClient
//
//  Created by Isabel Yepes on 5/10/14.
//  Copyright (c) 2014 Isabel Yepes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onLogin(sender: AnyObject) {
        
        HCOTwitterAPIConsumer.sharedInstance.loginWithCompletion() {
            (user: HCOTwitterUser?, error: NSError?) in
            if user != nil {
                //perform segue
                self.performSegueWithIdentifier("openTimeLineSegue", sender: self)
            } else {
                //handle error
            }
        }
    }
}

