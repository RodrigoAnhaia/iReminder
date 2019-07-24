//
//  ViewController.swift
//  iReminder
//
//  Created by Giovani Nícolas Bettoni on 18/07/19.
//  Copyright © 2019 Giovani Nícolas Bettoni. All rights reserved.
//

import UIKit
import UICircularProgressRing

class ViewController: UIViewController {

    var water = WaterHK()

    @IBOutlet weak var progressRing: UICircularProgressRing!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressRing.value = 0
        
    }
    
    @IBAction func startAnimation(_ sender: UICircularProgressRing) {
        progressRing.startProgress(to: 100, duration: 10.0) {
            print("Done animating!")
            // Do anything your heart desires...
        }
    }
    
    @IBAction func pauseAnimation(_ sender: UICircularProgressRing) {
        progressRing.pauseProgress()
        print("paused")
    }
    
    @IBAction func continueAnimation(_ sender: UICircularProgressRing) {
        progressRing.continueProgress()
        print("continued..")
    }
    
    @IBAction func resetProgress(_ sender: UICircularProgressRing) {
        progressRing.resetProgress()
        print("reset")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let requestPermission = water.requestHealthPermission()
        if requestPermission == false {
            print("OPS TEMOS UM PROBLEMA SHEROKY")
        } else {
            print("Alright")
        }
    }
    

}

