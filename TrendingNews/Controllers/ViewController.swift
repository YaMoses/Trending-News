//
//  ViewController.swift
//  TrendingNews
//
//  Created by Yamusa Dalhatu on 5/11/18.
//  Copyright © 2018 Yamusa Dalhatu. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    

    var newsArray : [[String : AnyObject]] = [[String : AnyObject]]()
    var news = [News]()
    
    @IBOutlet weak var newsTableView: UITableView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchAPIData {
            self.newsTableView?.reloadData()
        }
    }
    
    
    
   //Mark: Network Stuff
    
    func fetchAPIData(completed: @escaping RequestCompleted) {
        
        //getting data from  api
        Alamofire.request(API_DATA).responseJSON { response in
            
            //getting json
            if let json = response.result.value as? [String : AnyObject]{
                
                //convert json to NSArray
                self.newsArray = json["articles"] as! [[String : AnyObject]]
                
                //go through all the elements
                for i in 0..<self.newsArray.count{
                    
                    //adding news values to the news list
                    self.news.append(News(
                        title: (self.newsArray[i] as AnyObject).value(forKey: "title") as? String,
                        description: (self.newsArray[i] as AnyObject).value(forKey: "description") as? String,
                        source: (self.newsArray[i] as AnyObject).value(forKey: "source") as? String,
                        timePosted:(self.newsArray[i] as AnyObject).value(forKey: "publishedAt") as? String,
                        imageUrl: (self.newsArray[i] as AnyObject).value(forKey: "urlToImage") as? String
                    ))
                }
                
                //displaying data in tableview
                self.newsTableView?.reloadData()
                
                self.newsTableView?.rowHeight = UITableViewAutomaticDimension
                //self.newsTableView.estimatedRowHeight = 120
            }
            
        }
         completed()
    }
    
    
    
    //Mark: Table Stuff 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsTableViewCell
        
        let data: News
        data = news[indexPath.row]
        
        cell.titleLabel.text = data.title
        
        //  cell.descriptionLabel.text = data.description
      //   cell.sourceLabel.text = "29 minutes ago"
    //    cell.timePostedLabel.text = data.timePosted

    
        //displaying image
        Alamofire.request(data.imageUrl!).responseImage { response in
            debugPrint(response)
            if response.result.isSuccess{
             let image = response.result.value
                print("image downloaded: \(String(describing: image))")
                cell.newsImage?.image = image
            }else{
                print("Error \(String(describing: response.result.error))")
            }
    }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    
    //Mark: Navigation Stuff 

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? NewsDetailViewController{
            destination.news = news[(newsTableView?.indexPathForSelectedRow?.row)!]
        }
    
    }
}
