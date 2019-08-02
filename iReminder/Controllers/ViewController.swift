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
        drinksProgressRing.startProgress(to: drinksProgressRing.currentValue! + 10, duration: 1.0)
    }
    
    
    @IBAction func addTripToBathroom(_ sender: UIButton) {
        print("Insere uma ida ao banheiro..")
        peeProgressRing.startProgress(to: peeProgressRing.currentValue! + 15, duration: 1.0)
    }
    
    
    @IBAction func pauseAnimation(_ sender: UICircularProgressRing) {
        drinksProgressRing.pauseProgress()
        peeProgressRing.pauseProgress()
        //print("paused in \(progressRing.currentValue)")
    }
    
    @IBAction func continueAnimation(_ sender: UICircularProgressRing) {
        drinksProgressRing.continueProgress()
        peeProgressRing.continueProgress()
        print("continued..")
    }
    
    @IBAction func resetProgress(_ sender: UICircularProgressRing) {
        drinksProgressRing.resetProgress()
        peeProgressRing.resetProgress()
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
