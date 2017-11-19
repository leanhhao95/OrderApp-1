//
//  MealList.swift
//  OrderMeal
//
//  Created by Luyen on 11/7/17.
//  Copyright © 2017 Luyen. All rights reserved.
//

import UIKit

class MealTVC: UITableViewController {
    var numberRecieve: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        showAlert(vc: self, title: "Warning", message: "Please enter number before checked!")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    // cac cell da duoc chon
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // tao cell trong truong hop co indexpath
        let cell = tableView.cellForRow(at: indexPath as IndexPath) as! MealTableViewCell
        if cell.accessoryType == .none && cell.numberFoodTextField.text != "0"  {
            self.navigationItem.leftBarButtonItem?.title = "Clear All Edit"
            cell.accessoryType = .checkmark
            cell.isUserInteractionEnabled = false
        }
        //  neu co dau tich thi send du lieu sang man ben
        if cell.accessoryType == .checkmark {
            TransactionServices.shared.foodChosen.append(DataServices.shared.displayedFood[indexPath.row])
            TransactionServices.shared.qty.append(Int(cell.numberFoodTextField.text!)!)
        }
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Meals", for: indexPath) as! MealTableViewCell
        configureCell(cell, indexPath: indexPath)
        return cell
    }
    // dat du lieu cho cac cell
    func configureCell(_ cell: MealTableViewCell, indexPath : IndexPath) {
        // hien thi ten va gia trong foodplist
        cell.mealNameLabel.text = "\(DataServices.shared.displayedFood[indexPath.row].name)"
        cell.priceLabel.text =  "\(DataServices.shared.displayedFood[indexPath.row].price)"
        cell.photoImageView.image = UIImage(named: "\(DataServices.shared.displayedFood[indexPath.row].image)")
        if  cell.numberFoodTextField.text == "" || cell.numberFoodTextField.text == "\(0)" || TransactionServices.shared.qty == [] {
        cell.numberFoodTextField.text = String(0)
            cell.accessoryType = .none
            cell.isUserInteractionEnabled = true
        } else {
            cell.numberFoodTextField.text = String(TransactionServices.shared.qty[indexPath.row])
        }
    }
    // thay doi ten va chuc nang leftbarbutton
    @IBAction func clearBarButton(_ sender: UIBarButtonItem) {
        if sender.title == "Cancel" {
            navigationController?.popViewController(animated: true)
        } else {
            TransactionServices.shared.foodChosen.removeAll()
            TransactionServices.shared.qty.removeAll()
            sender.title = "Cancel"
            tableView.reloadData()
        }
        
    }
}

func showAlert(vc: UIViewController, title:String, message: String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    
    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in}
    
    alertController.addAction(okAction)
    
    vc.present(alertController, animated: true, completion: nil)
}
