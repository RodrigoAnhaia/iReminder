/*
  HealthStoreContainer.swift
  iReminder

  Created by Giovani Nícolas Bettoni on 25/07/19.
  Copyright © 2019 Giovani Nícolas Bettoni. All rights reserved.
 
  Abstract:
   A protocol for objects that access the health store.

*/

import HealthKit

protocol HealthStoreContainer {
    // A required property that contains the health store.
    var healthStore: HKHealthStore! { get set }
}
