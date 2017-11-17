//
//  DataService.swift
//  OrderApp
//
//  Created by HoangLuyen on 11/17/17.
//  Copyright © 2017 Luyen. All rights reserved.
//

import Foundation
class DataServices {
    static let shared : DataServices = DataServices()
    var selectedFood: Int? {
        didSet{
            if selectedFood != nil {
                displayedFood = food.filter({
                    $0.restaurantCode == selectedFood!
                })
            }
        }
    }
    var displayedFood :[Food] = []
    private var _food: [Food]?
    var food: [Food] {
        get {
            if _food == nil {
                loadFoodList()
            }
            return _food ?? []
        }
        set{
            _food = newValue
        }
    }
    private var _restaurant : [Restaurant]?
    var restaurant: [Restaurant] {
        get {
            if _restaurant ==  nil {
                loadRestaurantPlist()
            }
            return _restaurant ?? []
        }
        set {
            _restaurant = newValue
        }
    }
    func loadFoodList() {
        guard let dictionary = PlistServices().getDictionaryFrom(plist: "Food.plist") else {return}
        guard let foodDictionaries = dictionary["Food"] as? [Dictionary <String,Any>] else {return}
        _food = []
        for foodDictionary in foodDictionaries {
            if let food = Food(dictionary: foodDictionary) {
                _food?.append(food)
            }
        }
    }
    func loadRestaurantPlist() {
        guard let dictionary = PlistServices().getDictionaryFrom(plist: "Restaurant.plist") else {return}
        guard let restaurantDictionaries = dictionary["Restaurant"] as? [Dictionary <String,Any>] else {return}
        _restaurant = []
        for restaurantDictionary in restaurantDictionaries {
            if let restaurant = Restaurant(dictionary: restaurantDictionary) {
                _restaurant?.append(restaurant)
            }
        }
    }
}
