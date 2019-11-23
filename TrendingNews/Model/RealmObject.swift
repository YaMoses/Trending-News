//
//  RealmObject.swift
//  TrendingNews
//
//  Created by Yamusa Dalhatu on 5/16/18.
//  Copyright © 2018 Yamusa Dalhatu. All rights reserved.
//

import Foundation
import RealmSwift


class RealmObject: Object {
    
    @objc dynamic var title: String!
    @objc dynamic var fullnews: String?
    //@objc dynamic var imageUrl: String?
}

extension RealmObject{
    func writeToRealm(){

        do {
            try uiRealm.write({
                uiRealm.add(self)
                print("Saved")
            })
        }catch let error {
            print(error)
        }
    }
}


