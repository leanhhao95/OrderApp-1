//
//  MealList.swift
//  OrderMeal
//
//  Created by Luyen on 11/7/17.
//  Copyright © 2017 Luyen. All rights reserved.
//

import UIKit

class MealTVC: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DataServices.shared.displayedFood.count
    }
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        if isPresentingInAddMealMode {
            dismiss(animated: true, completion: nil)
        } else {
            if let owningNavigationController = navigationController {
                owningNavigationController.popViewController(animated: true)
            } else {
                fatalError("The MealViewController is not inside a navigation controller.")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let cell = tableView.cellForRow(at: indexPath as IndexPath) else {return}
            if cell.accessoryType == .none{
                cell.accessoryType = .checkmark
            }
            else{
                cell.accessoryType = .none
            }
        
        if cell.accessoryType == .checkmark {
            TransactionServices.shared.foodChosen.append(DataServices.shared.displayedFood[indexPath.row])
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Meals", for: indexPath) as! MealTableViewCell
        
        cell.mealNameLabel.text = "\(DataServices.shared.displayedFood[indexPath.row].name)"
        cell.priceLabel.text =  "\(DataServices.shared.displayedFood[indexPath.row].price)"
        if cell.accessoryType == .checkmark {
           cell.accessoryType = .none
        }
        return cell
    }
    
    
    
    
    
}
