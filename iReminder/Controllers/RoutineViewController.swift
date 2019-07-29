//
//  RoutineViewController.swift
//  iReminder
//
//  Created by Giovani Nícolas Bettoni on 25/07/19.
//  Copyright © 2019 Giovani Nícolas Bettoni. All rights reserved.
//

import UIKit

class RoutineViewController: UIViewController, UITextFieldDelegate {

    var datePicker: UIDatePicker = UIDatePicker()
    @IBOutlet weak var textToBed: UITextField!
    @IBOutlet weak var textToAwake: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textToAwake.delegate = self
        textToBed.delegate = self
        
        
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
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "00:00"
        //UITextField.text = timeFormatter.string(from: sender.date)
    
    }
    
    @IBAction func addItemToRoutine(_ sender: UIButton) {
        print("Adicionando item na tableView")
    }
    
    
}
