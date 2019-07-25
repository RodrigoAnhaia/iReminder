//
//  RoutineViewController.swift
//  iReminder
//
//  Created by Giovani Nícolas Bettoni on 25/07/19.
//  Copyright © 2019 Giovani Nícolas Bettoni. All rights reserved.
//

import UIKit

class RoutineViewController: UIViewController {

    var datePicker: UIDatePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func timeToWake(_ sender: UITextField) {
        datePicker.datePickerMode = .time
        sender.inputView = datePicker
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: .valueChanged)
        
    }
    
    @objc func datePickerValueChanged(sender: UIDatePicker) {
        var timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "00:00"
        //UITextField.text = timeFormatter.string(from: sender.date)
        
        
    }
    
    @IBAction func timeToBed(_ sender: UITextField) {
        datePicker.datePickerMode = .time
        sender.inputView = datePicker
        datePicker.addTarget(self, action: #selector(RoutineViewController.datePickerValueChanged), for: UIControl.Event.valueChanged)
        
    }
    
}
