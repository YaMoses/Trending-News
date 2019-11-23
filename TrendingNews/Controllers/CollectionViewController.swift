//
//  CollectionViewController.swift
//  TrendingNews
//
//  Created by Yamusa Dalhatu on 5/17/18.
//  Copyright © 2018 Yamusa Dalhatu. All rights reserved.
//

import UIKit
import Firebase

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    @IBOutlet weak var newsCollectionViews: UICollectionView!
    
    let newss = [ "cnnnews" , "abcnews" , "aljazeera"  , "bbcnews" , "techCrunch" , "newYorkTimes", "Bookmarked" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func logoutButtonPressed(_ sender: UIBarButtonItem) {
        
        do{
            try Auth.auth().signOut()
            
            navigationController?.popToRootViewController(animated: true)
        }
        catch {
            print("error: there was a problem logging out")
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newss.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NewsCollectionViewCell
        
        cell.newsImage.image = UIImage(named: newss[indexPath.row])
        cell.newNameLabel.text = newss[indexPath.row]
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let name = "trend"
        if indexPath.row == 0 {
            let vc = storyboard?.instantiateViewController(withIdentifier: name) // or your custom view controller
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        else if indexPath.row == 6 {
            let name = "fav"
           let vc = storyboard?.instantiateViewController(withIdentifier: name )
           self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
