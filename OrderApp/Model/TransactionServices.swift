//
//  TransactionServices.swift
//  OrderApp
//
//  Created by AnhHao on 11/17/17.
//  Copyright © 2017 Luyen. All rights reserved.
//

import Foundation
struct defaultKeys{
    static let dateKey = "dateKey"
    static let priceKey = "priceKey"
}
class TransactionServices {
    static let shared : TransactionServices = TransactionServices()
    var foodChosen:[Food] = []
    var qty = [Int]()
    var price : Int = 0
    var data: Int = 1
    var total : Int = 0
    var array = [Int]()
    var arraydate = [String]()
    var arrayPrice = [Int]()
    
    func saveData(){
        var saveString = [String]()
        saveString
    }
    
   private var _totalAllFoodChosen: Int = 0
    var totalAllFoodChosen: Int {
        get {
            if _totalAllFoodChosen == 0 {
                calculatorTotal()
            }
            return _totalAllFoodChosen
        }
        set {
            _totalAllFoodChosen = newValue
        }
    }
    func calculatorTotal() {
        for i in array {
            _totalAllFoodChosen += i
        }
    }
}

