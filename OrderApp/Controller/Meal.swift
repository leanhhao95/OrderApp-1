//
//  Meal.swift
//  OrderApp
//
//  Created by AnhHao on 11/19/17.
//  Copyright © 2017 Luyen. All rights reserved.
//

import Foundation
import os.log
import UIKit
struct PropertyKey {
    static let name = "name"
    static let price = "price"
}


class Meal: NSObject,NSCoding {
    var name: String
    var price: Int
   
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
    
    // create a file path to data
    // Mark: Archiving paths:
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(price, forKey: PropertyKey.price)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        guard let price = aDecoder.decodeObject(forKey: PropertyKey.price) as? Int else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        self.init(name: name, price: price)
    }
}

