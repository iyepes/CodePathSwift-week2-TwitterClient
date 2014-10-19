//
//  HCOTimelineViewController.swift
//  HCOTwitterClient
//
//  Created by Isabel Yepes on 18/10/14.
//  Copyright (c) 2014 Isabel Yepes. All rights reserved.
//

import UIKit

class HCOTimelineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var timelineTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timelineTableView.delegate = self
        timelineTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("HCOTweetCell") as HCOTweetCell
        
        cell.userNameLabel.text = "Username"
        cell.userScreenNameLabel.text = "ScreenName"
        cell.timeLabel.text = "hh"
        
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
