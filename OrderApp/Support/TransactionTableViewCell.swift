//
//  TransactionTableViewCell.swift
//  OrderApp
//
//  Created by AnhHao on 11/18/17.
//  Copyright © 2017 Luyen. All rights reserved.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
   
    
    
    @IBOutlet weak var nameFoodChosenLabel: UILabel!
    @IBOutlet weak var priceFoodChosenLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
      
    
}
