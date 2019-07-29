//
//  RoutineViewController.swift
//  iReminder
//
//  Created by Giovani Nícolas Bettoni on 25/07/19.
//  Copyright © 2019 Giovani Nícolas Bettoni. All rights reserved.
//

import UIKit


class RoutineViewController: UIViewController, UITextFieldDelegate {

    var modelRoutine: Routine = Routine(weekday: "Monday", timeToAwake: "10:00", timeToSleep: "23:00")
    let defaults = UserDefaults.standard
    
    var datePicker: UIDatePicker = UIDatePicker()
    
    // Outlets
    @IBOutlet weak var textToBed: UITextField!
    @IBOutlet weak var textToAwake: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textToAwake.delegate = self
        textToBed.delegate = self
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
    }
    
    func getData() {
        print("awakeHour\(modelRoutine.weekday) - sleepHour\(modelRoutine.weekday)")
        textToAwake.text = defaults.string(forKey: "awakeHour\(modelRoutine.weekday)")
        textToBed.text = defaults.string(forKey: "sleepHour\(modelRoutine.weekday)")
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string == "" {
            return true
        }
        
        if textField == textToAwake {
            if textField.text?.count == 5 {
                return false
            } else {
                return true
            }
        }
        
        if textField == textToBed {
            if textField.text?.count == 5 {
                return false
            } else {
                return true
            }
        }
        
        return true
    }
    
    @IBAction func timeToWake(_ sender: UITextField) {
        datePicker.datePickerMode = .time
        sender.inputView = datePicker
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: .valueChanged)
        
    }
    
    @IBAction func timeToBed(_ sender: UITextField) {
        datePicker.datePickerMode = .time
        sender.inputView = datePicker
        datePicker.addTarget(self, action: #selector(RoutineViewController.datePickerValueChanged), for: UIControl.Event.valueChanged)
        
    }
    
    @objc func datePickerValueChanged(sender: UIDatePicker) {
        var timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "00:00"
        //UITextField.text = timeFormatter.string(from: sender.date)
    
    }
    
    @IBAction func addItemToRoutine(_ sender: UIButton) {
        print("Adicionando item na tableView")
    }
    
    @IBAction func saveRoutineData(_ sender: Any) {
        print("Saving data in \(modelRoutine.weekday)...")
        
        modelRoutine.timeToAwake = textToAwake.text!
        defaults.set(modelRoutine.timeToAwake, forKey: "awakeHour\(modelRoutine.weekday)")
        
        modelRoutine.timeToSleep = textToBed.text!
        defaults.set(modelRoutine.timeToSleep, forKey: "sleepHour\(modelRoutine.weekday)")
        
        print("## All data has been saved ##")
        
    }
    
}
