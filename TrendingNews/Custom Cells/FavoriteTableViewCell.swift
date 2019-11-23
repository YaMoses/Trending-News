//
//  FavoriteTableViewCell.swift
//  TrendingNews
//
//  Created by Yamusa Dalhatu on 5/17/18.
//  Copyright © 2018 Yamusa Dalhatu. All rights reserved.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
