//
//  WaterHK.swift
//  iReminder
//
//  Created by Giovani Nícolas Bettoni on 22/07/19.
//  Copyright © 2019 Giovani Nícolas Bettoni. All rights reserved.
//

import Foundation
import HealthKit

class WaterHK: HealthStoreContainer {
    var healthStore: HKHealthStore!
    let type: HKObjectType
    private var unit: HKUnit
    private var totalDrank: Double
    
    var defaults = Defaults()
    
    
    init() {
        self.healthStore = HKHealthStore()
        self.type = HKObjectType.quantityType(forIdentifier: .dietaryWater)!
        self.totalDrank = 0.0
        let tempUnits = [HKUnit.literUnit(with: .milli), HKUnit.fluidOunceUS(), HKUnit.fluidOunceImperial()]
        self.unit = tempUnits[defaults.returnUnit()]
        //self.getTodayAmount()
        
    }
    
    func addAmount(amount: Double) {
        let sample: HKQuantitySample = HKQuantitySample(type: type as! HKQuantityType, quantity: .init(unit: unit, doubleValue: amount), start: Date(), end: Date())
        healthStore.save(sample) { (succes, error) in
            if !succes {
                print("Not successful")
            }
        }
        totalDrank = totalDrank + amount
        defaults.setTotalDrank(amount: totalDrank)
    }
    
    func returnUnits() -> String {
        switch defaults.returnUnit() {
        case 0:
            return "ml"
        default:
            return "fl oz"
        }
    }
    
    func returnTotalDrank() -> Double {
        return totalDrank
    }
    
    func requestHealthPermission() -> Bool {
        var requestSuccess: Bool = true
        let allTypes = Set([HKObjectType.quantityType(forIdentifier: .dietaryWater)!,
                            HKObjectType.quantityType(forIdentifier: .bodyMass)!,
                            HKObjectType.quantityType(forIdentifier: .height)!])
        
        healthStore.requestAuthorization(toShare: allTypes, read: allTypes) { (success, error) in
            if !success {
                requestSuccess = false
            }
        }
        print("Permission: \(requestSuccess)")
        return requestSuccess
    }
    
    func getTodayAmount() {
        let calendar = NSCalendar.current
        let now = Date()
        let components = calendar.dateComponents([.year, .month, .day], from: now)
        
        guard let startDate = calendar.date(from: components) else {
            fatalError("*** UNABLE TO CREATE THE START DATE ***")
        }
        
        let endDate = calendar.date(byAdding: .day, value: 1, to: startDate)
        
        guard let sampleType = HKSampleType.quantityType(forIdentifier: .dietaryWater) else {
            fatalError("*** THIS SHOULD NOT OCCUR ***")
        }
        
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: [])
        
        let query = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: Int(HKObjectQueryNoLimit), sortDescriptors: nil) { (query, results, error) in
            guard let samples = results as? [HKQuantitySample] else {
                _ = self.requestHealthPermission() // Don't quite know what to do with this value yet
                self.getTodayAmount()
                return
            }
            var total: Double = 0.0
            for sample in samples {
                total += sample.quantity.doubleValue(for: self.unit)
            }
            
            self.totalDrank = total
            self.defaults.setTotalDrank(amount: self.totalDrank)
        }
        
        healthStore.execute(query)
    }
    
}
