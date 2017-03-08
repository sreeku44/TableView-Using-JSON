//
//  PhotoTableViewController.swift
//  TableView Using JSON
//
//  Created by Sreekala Santhakumari on 3/6/17.
//  Copyright © 2017 Klas. All rights reserved.
//

import UIKit

class PhotoTableViewController: UITableViewController {
    
    var photos = [Photo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ShowPhotos()
    }
    
   private func ShowPhotos () {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")!
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        
        let dictionaries = try! JSONSerialization.jsonObject(with: data!, options:[]) as! [[String:Any]]
        
        for dictionary in dictionaries{
            
         let id = dictionary ["id"] as! Int
         let title = dictionary["title"] as! String
         let url = dictionary["url"] as! String
         let thumbnailUrl = dictionary["thumbnailUrl"] as! String
            
         let photo = Photo(id:id, title:title, url:url, thumbnailUrl:thumbnailUrl)
         self.photos.append(photo)
        
        }
    
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        //print (dictionaries)
    }.resume()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
                return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return self.photos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let photo = self.photos[indexPath.row]
        //cell.textLabel?.text = photo.title
       // cell.textLabel?.text = photo.url
       // cell.textLabel?.text = photo.thumbnailUrl
        cell.textLabel?.text = String(photo.id)
        
        let photoUrl = photo.thumbnailUrl
        
        DispatchQueue.global().async {
            let imageData = NSData(contentsOf: URL(string :photoUrl)!)
            let  photoImage  = UIImage (data: imageData! as Data)
        
        DispatchQueue.main.async {
          cell.imageView?.image = photoImage
        }
        }
        
        return cell
    }
    

    }
