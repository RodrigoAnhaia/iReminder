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
        progressRing.delegate = self
        
        // Change any of the properties
        progressRing.value = 0
        
        
        
        
    }
    
    @IBAction func addWaterPercentaje(_ sender: UIButton) {
        print("Insere água..")
        print("abcd//")
    }
    
    
    @IBAction func startAnimation(_ sender: UICircularProgressRing) {
        progressRing.startProgress(to: 100, duration: 10.0) {
            print("Done animating!")
            // Do anything your heart desires...
        }
    }
    
    @IBAction func pauseAnimation(_ sender: UICircularProgressRing) {
        progressRing.pauseProgress()
        //print("paused in \(progressRing.currentValue)")
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
        
    }
    
    func didPauseProgress(for ring: UICircularProgressRing) {
        
    }
    
    func didContinueProgress(for ring: UICircularProgressRing) {
        
    }
    
    func didUpdateProgressValue(for ring: UICircularProgressRing, to newValue: CGFloat) {
        
    }
    
    func willDisplayLabel(for ring: UICircularProgressRing, _ label: UILabel) {
        label.adjustsFontSizeToFitWidth = true
    }
    
    
}
