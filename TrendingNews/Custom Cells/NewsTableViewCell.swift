//
//  NewsTableViewCell.swift
//  TrendingNews
//
//  Created by Yamusa Dalhatu on 5/11/18.
//  Copyright © 2018 Yamusa Dalhatu. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsImage: UIImageView?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var timePostedLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setdataView(new: News) {
        self.titleLabel.text = new.title
    }

}
