//
//  MealTableViewCell.swift
//  OrderApp
//
//  Created by Luyen on 11/10/17.
//  Copyright © 2017 Luyen. All rights reserved.
//

import UIKit
class MealTableViewCell: UITableViewCell,UITextFieldDelegate {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var numberFoodTextField: UITextField!
    
    var data: Int = 1
    var qty = [Int]()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        numberFoodTextField.delegate = self
        numberFoodTextField.keyboardType = .numbersAndPunctuation
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text != "" {
            numberFoodTextField.text = textField.text
        } else {
            numberFoodTextField.text = "\(1)"
        }
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        numberFoodTextField.text = nil
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
        return string.rangeOfCharacter(from: invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }
    override func prepareForReuse() {
        priceLabel.text = ""
        mealNameLabel.text = ""
        numberFoodTextField.text = ""
    }
}

