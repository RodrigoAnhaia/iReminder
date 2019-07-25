//
//  Defaults.swift
//  iReminder
//
//  Created by Giovani Nícolas Bettoni on 25/07/19.
//  Copyright © 2019 Giovani Nícolas Bettoni. All rights reserved.
//

import Foundation

class Defaults {
    private let defaults: UserDefaults = UserDefaults.standard
    
    init() {
        if defaults.object(forKey: "userAmounts") == nil {
            defaults.set([8.0, 16.0, 24.0, 32.0], forKey: "userAmounts")
        }
        
        if defaults.object(forKey: "goalAmount") == nil {
            defaults.set(64.0, forKey: "goalAmount")
        }
        
        if defaults.object(forKey: "totalDrank") == nil {
            defaults.set(0.0, forKey: "totalDrnak")
        }
        
        if defaults.object(forKey: "unitForWater") == nil {
            defaults.set(1, forKey: "unitForWater")
        }
        
        if defaults.object(forKey: "theme") == nil {
            defaults.set(0, forKey: "theme")
        }
    }
    
    func setUserAmounts(amounts: [Double]) {
        defaults.set(amounts, forKey: "userAmounts")
    }
    
    func setGoalAmount(amount: Double) {
        defaults.set(amount, forKey: "goalAmount")
    }
    
    func setTotalDrank(amount: Double) {
        defaults.set(amount, forKey: "totalDrank")
    }
    
    func setUnitForWater(index: Int) {
        print(index)
        defaults.set(index, forKey: "unitForWater")
    }
    
    func setLastRunDate() {
        defaults.set(Date(), forKey: "lastRun")
    }
    
    func setTheme(index: Int) {
        defaults.set(index, forKey: "theme")
    }
    
    /**
     Used to return the defaults as a double array
     */
    func returnUserAmounts() -> [Double] {
        var processedAmounts: [Double] = []
        let amounts = defaults.array(forKey: "userAmounts")
        
        for amount in amounts! {
            processedAmounts.append(Double(amount as! Int))
        }
        
        return processedAmounts
    }
    
    /**
     Returns the goal that the user has set
     */
    func returnGoalAmount() -> Double {
        return defaults.double(forKey: "goalAmount")
    }
    
    /**
     Returns the total amount a user has drank
     */
    func returnTotalDrank() -> Double {
        return defaults.double(forKey: "totalDrank")
    }
    
    /**
     Returns the unit that the user set
     */
    func returnUnit() -> Int {
        return defaults.integer(forKey: "unitForWater")
    }
}
