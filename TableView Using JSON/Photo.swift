//
//  Photo.swift
//  TableView Using JSON
//
//  Created by Sreekala Santhakumari on 3/6/17.
//  Copyright © 2017 Klas. All rights reserved.
//

import UIKit

class Photo {
    
    var id :Int
    var title : String
    var url : String
    var thumbnailUrl : String
    
    init(id : Int, title : String, url : String, thumbnailUrl : String) {
        
    self.id  = id
    self.title = title
    self.url = url
    self.thumbnailUrl = thumbnailUrl
    }

}
