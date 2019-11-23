//
//  NewsDetailViewController.swift
//  TrendingNewsTests
//
//  Created by Yamusa Dalhatu on 5/14/18.
//  Copyright © 2018 Yamusa Dalhatu. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift

class NewsDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    var news:News?
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = news?.title
        descriptionLabel.text = news?.description
        
        Alamofire.request((news?.imageUrl!)!).responseImage { response in
            debugPrint(response)
            if response.result.isSuccess{
                let imagey = response.result.value
                //print("image downloaded: \(String(describing: image))")
                self.imageView.image = imagey
            }else{
                print("Error \(String(describing: response.result.error))")
            }
            
        }
        
    }

   
    @IBAction func favoriteButtonisPressed(_ sender: UIButton) {
        
        favoriteButton.setImage(UIImage(named: "redHeart.png"), for: UIControlState.normal)
        getData()
        sender.isUserInteractionEnabled = false
        
        // create the alert
        let alert = UIAlertController(title: "Favorite", message: "Successfully added to favorites.", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //Mark: Realm stuff 
    
    var realmdb = RealmObject()
    
    func getData() {
        realmdb.title = news?.title
        realmdb.fullnews = news?.description
       // realmdb.imageUrl = news?.imageUrl
        realmdb.writeToRealm()
        print("Title: \(String(describing: realmdb.title))")
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
    }

}
