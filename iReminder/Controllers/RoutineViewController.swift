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
    
    private var pickerTimeToAwake : UIDatePicker!
    private var pickerTimeToBed : UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        textToAwake.delegate = self
        //textToAwake.placeholder = "Time to Awake"
        textToBed.delegate = self
        //textToBed.placeholder = "Time to Bed"
        
        createTimePicker()
        
    }
    
    func createTimePicker() {
        
        //Picker init
        
        pickerTimeToAwake = UIDatePicker()
        pickerTimeToAwake!.datePickerMode = .time
        pickerTimeToAwake?.addTarget(self, action: #selector(RoutineViewController.timeChanged(pickerTime:)), for: .valueChanged)
        
        pickerTimeToBed = UIDatePicker()
        pickerTimeToBed!.datePickerMode = .time
        pickerTimeToBed?.addTarget(self, action: #selector(RoutineViewController.timeChanged(pickerTime:)), for: .valueChanged)
        
        textToAwake.inputView = pickerTimeToAwake
        textToBed.inputView = pickerTimeToBed
        
        //ToolBar for picker
        let toolBar = UIToolbar()
        
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 61/255, green: 113/255, blue: 128/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(doneButton(_:)))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancelButton(_:)))
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        toolBar.backgroundColor = #colorLiteral(red: 0.7803921569, green: 0.9529411765, blue: 1, alpha: 1)
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        textToAwake.inputAccessoryView = toolBar
        textToBed.inputAccessoryView = toolBar
    }
    
    @objc func timeChanged(pickerTime : UIDatePicker) {
        toString()
   
    }
    

    
    @objc func doneButton(_ sender: UIButton) {
       
        toString()
    
        // Tira o teclado
        textToAwake.resignFirstResponder()
        textToBed.resignFirstResponder()
        
    }
    
    @objc func cancelButton(_ sender: UIButton) {
        textToAwake.resignFirstResponder()
        textToBed.resignFirstResponder()
    }
    
    func toString() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.dateFormat = "HH:mm"
        
        
        textToAwake.text = formatter.string(from: pickerTimeToAwake!.date)
        textToBed.text = formatter.string(from: pickerTimeToBed!.date)
    }
    
    @IBAction func addItemToRoutine(_ sender: UIButton) {
        print("Adicionando item na tableView")
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
    
    @IBAction func saveRoutineData(_ sender: Any) {
        print("Saving data in \(modelRoutine.weekday)...")
        
        modelRoutine.timeToAwake = textToAwake.text!
        print(textToAwake.text!)
        defaults.set(modelRoutine.timeToAwake, forKey: "awakeHour\(modelRoutine.weekday)")
        
        modelRoutine.timeToSleep = textToBed.text!
        print(textToBed.text!)
        defaults.set(modelRoutine.timeToSleep, forKey: "sleepHour\(modelRoutine.weekday)")
        
        print("## All data has been saved ##")
        
    }
    
    
}
