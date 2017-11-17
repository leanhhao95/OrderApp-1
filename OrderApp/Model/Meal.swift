//
//  Meal.swift
//  OrderApp
//
//  Created by Luyen on 11/10/17.
//  Copyright © 2017 Luyen. All rights reserved.
//

import UIKit
import os.log

class Meal: NSObject, NSCoding {
    
    //MARK : properties
    var name: String
    var photo: UIImage?
    var price: Int
//    //MARK : Archiving paths
//    static let DocumenstDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
//    static let ArchiveRUL = DocumentsDirectory
    //MARK: type
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let price = "price"
    }
    // MARK: Init
    init?(name: String, photo: UIImage?, price: Int) {
        if name.isEmpty || price < 0 {
            return nil
        }
        self.name = name
        self.photo = photo
        self.price = price
    }
    //MARK: NSconding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name , forKey: PropertyKey.name)
        aCoder.encode(photo , forKey: PropertyKey.photo)
        aCoder.encode(price , forKey: PropertyKey.price)
    }
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decoder the name for a meal object", log: OSLog.default, type: .debug)
            return nil
        }
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        let price = aDecoder.decodeInteger(forKey: PropertyKey.price)
        self.init(name: name, photo: photo, price: price)
        
    }
}
