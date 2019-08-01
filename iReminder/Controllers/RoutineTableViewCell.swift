//
//  RoutineTableViewCell.swift
//  iReminder
//
//  Created by Giovani Nícolas Bettoni on 31/07/19.
//  Copyright © 2019 Giovani Nícolas Bettoni. All rights reserved.
//

import UIKit

class RoutineTableViewCell: UITableViewCell {
    
    @IBOutlet weak var hourDrink: NSLayoutConstraint!
    @IBOutlet weak var typeDrink: UILabel!
    @IBOutlet weak var amountDrink: UILabel!
    @IBOutlet weak var drinkImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
