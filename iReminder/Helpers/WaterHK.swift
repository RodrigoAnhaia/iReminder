//
//  WaterHK.swift
//  iReminder
//
//  Created by Giovani Nícolas Bettoni on 22/07/19.
//  Copyright © 2019 Giovani Nícolas Bettoni. All rights reserved.
//

import Foundation
import HealthKit

class WaterHK {
    let healthStore: HKHealthStore
    let type: HKObjectType
    let clinical: HKClinicalType
//    private var unit: HKUnit
    
    
    init() {
        self.healthStore = HKHealthStore()
        self.type = HKObjectType.quantityType(forIdentifier: .dietaryWater)!
        self.clinical = HKClinicalType.clinicalType(forIdentifier: .vitalSignRecord)!
        
        //let tempUnits = [HKUnit.literUnit(with: .milli), HKUnit.fluidOunceUS(), HKUnit.fluidOunceImperial()]
        //self.unit = tempUnits[]
        
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
    
}
