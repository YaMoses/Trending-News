//
//  FavoriteNewsViewController.swift
//  TrendingNews
//
//  Created by Yamusa Dalhatu on 5/14/18.
//  Copyright © 2018 Yamusa Dalhatu. All rights reserved.
//

import UIKit
import RealmSwift

class FavoriteNewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
   
    
    
    @IBOutlet weak var favoriteTableView: UITableView!
    
    var lists : Results<RealmObject>?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        readTasksAndUpdateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func readTasksAndUpdateUI(){
        
        lists = uiRealm.objects(RealmObject.self)
        self.favoriteTableView.reloadData()
        self.favoriteTableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favoriteTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FavoriteTableViewCell
        
        let data: RealmObject
        data = lists![indexPath.row]
        
        cell.descriptionLabel.text = data.fullnews
        cell.titleLabel.text = data.title
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.destructive, title: "Delete") { (deleteAction, indexPath) -> Void in

            //Deletion will go here

            let listToBeDeleted = self.lists![indexPath.row]
            
            do{
            try uiRealm.write({ () -> Void in
                uiRealm.delete(listToBeDeleted)
                self.readTasksAndUpdateUI()
            })
            }catch let error {
                print(error)
            }
        }
             return [deleteAction]
        }

    
}
    
    

