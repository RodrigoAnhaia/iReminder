//
//  TodayViewController.swift
//  iReminder
//
//  Created by Giovani Nícolas Bettoni on 02/08/19.
//  Copyright © 2019 Giovani Nícolas Bettoni. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController {

    @IBOutlet weak var dailyTableView: UITableView!
    
    var modelRoutine: Routine = Routine(weekday: "", timeToAwake: "", timeToSleep: "")
    var modelDrinks: [Drinks] = [Drinks(typeDrink: "water", amountDrink: "200 ml",hourDrink: "08:30"),
                                 Drinks(typeDrink: "coffee", amountDrink: "240 ml", hourDrink: "09:00"),
                                 Drinks(typeDrink: "water", amountDrink: "240 ml", hourDrink: "13:12"),
                                 Drinks(typeDrink: "coffee", amountDrink: "360 ml", hourDrink: "13:30"),
                                 Drinks(typeDrink: "wine", amountDrink: "340 ml", hourDrink: "20:44"),
                                 Drinks(typeDrink: "beer", amountDrink: "500 ml", hourDrink: "20:44"),
                                 Drinks(typeDrink: "water", amountDrink: "280 ml", hourDrink: "21:42")]
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dailyTableView.delegate = self
        dailyTableView.dataSource = self
        
        
    }
    
}

extension TodayViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelDrinks.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            modelDrinks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dailyTableView.dequeueReusableCell(withIdentifier: "DailyList") as? TodayTableViewCell
        
        let allDrinks = modelDrinks[indexPath.row]
        
        cell?.amountDrink.text = "(\(allDrinks.amountDrink))"
        cell?.hourDrink.text = allDrinks.hourDrink
        cell?.typeDrink.text = allDrinks.typeDrink
        switch cell?.typeDrink.text {
        case "water":
            cell?.imageDrink.image = UIImage(named: "water")
        case "coffee":
            cell?.imageDrink.image = UIImage(named: "coffee")
        case "wine":
            cell?.imageDrink.image = UIImage(named: "wine")
        case "beer":
            cell?.imageDrink.image = UIImage(named: "beer")
        default:
            print("default images")
        }
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = dailyTableView.dequeueReusableCell(withIdentifier: "DailyList") as? TodayTableViewCell
        
        
    }



}

