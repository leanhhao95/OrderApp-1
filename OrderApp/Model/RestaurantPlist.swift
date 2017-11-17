//
//  RestaurantPlist.swift
//  OrderApp
//
//  Created by AnhHao on 11/17/17.
//  Copyright © 2017 Luyen. All rights reserved.
//

import Foundation
class Restaurant {
    var name: String
    var restaurantCode: Int
    var address: String
    init(name: String, restaurantCode: Int, address: String){
        self.name = name
        self.restaurantCode = restaurantCode
        self.address = address
    }
    convenience init?(dictionary: Dictionary<String,Any>) {
        guard let name = dictionary["Name"] as? String, let restaurantCode = dictionary["RestaurantCode"] as? Int, let address = dictionary["Address"] as? String else {return nil}
        self.init(name: name, restaurantCode: restaurantCode, address: address)
    }
}


