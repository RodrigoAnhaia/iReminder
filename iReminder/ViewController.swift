//
//  ViewController.swift
//  iReminder
//
//  Created by Giovani Nícolas Bettoni on 18/07/19.
//  Copyright © 2019 Giovani Nícolas Bettoni. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var pieChart: PieChartView!
    
    @IBOutlet weak var iosStepper: UIStepper!
    @IBOutlet weak var blankStepper: UIStepper!
    
    var iosDataEntry = PieChartDataEntry(value: 0)
    var blankDataEntry = PieChartDataEntry(value: 0)

    var numberOfDownloadsDataEntries = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pieChart.chartDescription?.text = "Data Wather"
        
        iosDataEntry.value = iosStepper.value
        iosDataEntry.label = "IOS"
        
        blankDataEntry.value = blankStepper.value
        blankDataEntry.label = "Vazio"
        
        
        numberOfDownloadsDataEntries = [iosDataEntry, blankDataEntry]
        
        updateChartData()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !UserDefaults.standard.bool(forKey: "didSee") {
            UserDefaults.standard.set(true, forKey: "didSee")
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "tutorial")
           present(viewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func iosChanger(_ sender: UIStepper) {
        iosDataEntry.value = sender.value
        updateChartData()
        
        
    }
    
    @IBAction func blankChanger(_ sender: UIStepper) {
        blankDataEntry.value = sender.value
        updateChartData()
        
        
    }
    
    func updateChartData() {
        
        let chartDataSet = PieChartDataSet(entries: numberOfDownloadsDataEntries,label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors = [UIColor(cgColor: #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)), UIColor(cgColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))]
        chartDataSet.colors = colors as! [NSUIColor]
        
        pieChart.data = chartData
        
    }
    
}

