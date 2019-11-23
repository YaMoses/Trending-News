//
//  News.swift
//  TrendingNews
//
//  Created by Yamusa Dalhatu on 5/11/18.
//  Copyright © 2018 Yamusa Dalhatu. All rights reserved.
//

import Foundation

class News {
    var title : String?
    var description : String?
    var source : String?
    var timePosted : String?
    var imageUrl : String?
    
    init(title: String?, description: String?, source: String?, timePosted: String?, imageUrl: String?) {

        self.title = title
        self.description = description
        self.source = source
        self.timePosted = timePosted
        self.imageUrl = imageUrl

    }
  
}
