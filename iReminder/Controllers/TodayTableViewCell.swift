//
//  TodayTableViewCell.swift
//  iReminder
//
//  Created by Giovani Nícolas Bettoni on 02/08/19.
//  Copyright © 2019 Giovani Nícolas Bettoni. All rights reserved.
//

import UIKit

class TodayTableViewCell: UITableViewCell {
    
    @IBOutlet weak var isOnDList: UISwitch!
    @IBOutlet weak var imageDrink: UIImageView!
    @IBOutlet weak var typeDrink: UILabel!
    @IBOutlet weak var amountDrink: UILabel!
    @IBOutlet weak var hourDrink: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
