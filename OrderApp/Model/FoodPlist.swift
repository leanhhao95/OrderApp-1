//
//  FoodPlist.swift
//  OrderApp
//
//  Created by AnhHao on 11/17/17.
//  Copyright © 2017 Luyen. All rights reserved.
//

import Foundation

class Food {
    var name: String
    var restaurantCode: Int
    var price: Int
    init(name: String, restaurantCode: Int, price: Int){
        self.name = name
        self.restaurantCode = restaurantCode
        self.price = price
    }
    convenience init?(dictionary: Dictionary<String,Any>) {
        guard let name = dictionary["Name"] as? String, let restaurantCode = dictionary["RestaurantCode"] as? Int, let price = dictionary["Price"] as? Int else {return nil}
        self.init(name: name, restaurantCode: restaurantCode, price: price)
    }
}
