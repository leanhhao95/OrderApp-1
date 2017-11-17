//
//  ListRestaurant.swift
//  OrderMeal
//
//  Created by Luyen on 11/7/17.
//  Copyright © 2017 Luyen. All rights reserved.
//

import UIKit
class RestaurantTVC: UITableViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DataServices.shared.restaurant.count
     
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = DataServices.shared.restaurant[indexPath.row].name
        cell.detailTextLabel?.text = DataServices.shared.restaurant[indexPath.row].address
        return cell
    }
    @IBAction func openSlideMenu(_ sender: UIBarButtonItem) {
        NotificationCenter.default.post(name: NotificationKey.slideMenuKey, object: nil)
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DataServices.shared.selectedFood = DataServices.shared.restaurant[indexPath.row].restaurantCode
    }
    
    
}

