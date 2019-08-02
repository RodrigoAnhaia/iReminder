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
    @IBOutlet weak var tripsBathroom: UILabel!
    @IBOutlet weak var amountDrink: UILabel!
    
    var water = WaterHK()
    
    @IBOutlet weak var drinksProgressRing: UICircularProgressRing!
    
    @IBOutlet weak var peeProgressRing: UICircularProgressRing!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drinksProgressRing.delegate = self
        peeProgressRing.delegate = self
        // Change any of the properties
        drinksProgressRing.value = 0
        peeProgressRing.value = 0
        
        
        
        
    }
    
    @IBAction func addWaterPercentaje(_ sender: UIButton) {
        print("Insere 10% de água..")
        var amountWater: Int = Int(amountDrink.text!)!
        amountWater = amountWater + 1
        amountDrink.text = String(amountWater)
        drinksProgressRing.startProgress(to: drinksProgressRing.currentValue! + 10, duration: 1.0)
        
    }
    
    
    @IBAction func addTripToBathroom(_ sender: UIButton) {
        print("Insere uma ida ao banheiro..")
        var trip: Int = Int(tripsBathroom.text!)!
        trip = trip + 1
        tripsBathroom.text = String(trip)
        peeProgressRing.startProgress(to: peeProgressRing.currentValue! + 20, duration: 1.0)
    }
    
    @IBAction func resetProgress(_ sender: UICircularProgressRing) {
        drinksProgressRing.resetProgress()
        amountDrink.text = "0"
        peeProgressRing.resetProgress()
        tripsBathroom.text = "0"
        print("reset")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        _ = water.requestHealthPermission()
        
        if !UserDefaults.standard.bool(forKey: "didSee") {
            UserDefaults.standard.set(true, forKey: "didSee")
        
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "tutorial")
            present(viewController, animated: true, completion: nil)
        }
    
    }
}

extension ViewController: UICircularProgressRingDelegate {
    func didFinishProgress(for ring: UICircularProgressRing) {
        
        
        print("Current Value \(ring.currentValue!)")
        print("complete all rings for the day")
    }
    
    func didPauseProgress(for ring: UICircularProgressRing) {
        if drinksProgressRing.currentValue == 10 {
            drinksProgressRing.pauseProgress()
        }
        if peeProgressRing.currentValue == 10 {
            peeProgressRing.pauseProgress()
        }
    }
    
    func didContinueProgress(for ring: UICircularProgressRing) {
        
    }
    
    func didUpdateProgressValue(for ring: UICircularProgressRing, to newValue: CGFloat) {
        
    }
    
    func willDisplayLabel(for ring: UICircularProgressRing, _ label: UILabel) {
        
    }
    
    
}
