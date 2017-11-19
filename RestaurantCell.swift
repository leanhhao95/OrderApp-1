//
//  RestaurantCell.swift
//  OrderApp
//
//  Created by AnhHao on 11/20/17.
//  Copyright © 2017 Luyen. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {

    @IBOutlet weak var backGroundImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
