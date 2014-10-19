//
//  HCOTweetCell.swift
//  HCOTwitterClient
//
//  Created by Isabel Yepes on 18/10/14.
//  Copyright (c) 2014 Isabel Yepes. All rights reserved.
//

import UIKit

class HCOTweetCell: UITableViewCell {
    

    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var userScreenNameLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var tweetTextLabel: UILabel!
 
    @IBOutlet weak var replyImageView: UIImageView!
 
    @IBOutlet weak var retweetImageView: UIImageView!
    
    @IBOutlet weak var favImageView: UIImageView!
    
    @IBOutlet weak var retweetedImageView: UIImageView!
    
    @IBOutlet weak var retweetsLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
