//
//  RoutineViewController.swift
//  iReminder
//
//  Created by Giovani Nícolas Bettoni on 25/07/19.
//  Copyright © 2019 Giovani Nícolas Bettoni. All rights reserved.
//

import UIKit



class RoutineViewController: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var routineTableView: UITableView!
    var modelRoutine: Routine = Routine(weekday: "", timeToAwake: "", timeToSleep: "")
    var modelDrinks: [Drinks] = [Drinks(typeDrink: "water", amountDrink: "200 ml",hourDrink: "08:30"),
                                 Drinks(typeDrink: "coffee", amountDrink: "240 ml", hourDrink: "09:00"),
                                 Drinks(typeDrink: "water", amountDrink: "240 ml", hourDrink: "13:12"),
                                 Drinks(typeDrink: "wine", amountDrink: "500 ml", hourDrink: "20:34"),
                                 Drinks(typeDrink: "water", amountDrink: "280 ml", hourDrink: "21:42")]
    let defaults = UserDefaults.standard
    
    var datePicker: UIDatePicker = UIDatePicker()
    
    // Outlets
    @IBOutlet weak var textToBed: UITextField!
    @IBOutlet weak var textToAwake: UITextField!
    @IBOutlet weak var addDrink: UIButton!
    
    private var pickerTimeToAwake : UIDatePicker!
    private var pickerTimeToBed : UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        routineTableView.dataSource = self
        routineTableView.delegate = self
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
        showCustomAlert()
    }
    
    func showCustomAlert() {
        var custom_type: UITextField?
        custom_type?.layer.cornerRadius = 5
        var custom_amount: UITextField?
        custom_amount?.layer.cornerRadius = 5
        var custom_hour: UITextField?
        custom_hour?.layer.cornerRadius = 5
        
        let alertController = UIAlertController(title: "Add likely drink on weekday", message: "Please add the drinks you normally drink this day of the week", preferredStyle: .alert)
        
        let drinkAction = UIAlertAction(title: "Adding custom drink in \(modelRoutine.weekday)", style: .default) { (action) in
            
            var userType: String = ""
            var userAmount: String = ""
            var userHour: String = ""
            
            if let type = custom_type?.text {
                print(type)
                userType = type
                print(userType)
                // Save data do CoreData
                
            }else {
                alertController.dismiss(animated: true, completion: nil)
            }
            if let amt = custom_amount?.text {
                print(amt)
                userAmount = amt
                print(userAmount)
                // Save data do CoreData
                //self.waterlog.addAmount(amount: userAmount)
                //_ = self.updateTotalAmount()
            }else {
                alertController.dismiss(animated: true, completion: nil)
            }
            if let hour = custom_hour?.text {
                print(hour)
                userHour = hour
                print(userHour)
                // Save data do CoreData
                //self.waterlog.addAmount(amount: userAmount)
                //_ = self.updateTotalAmount()
            } else {
                alertController.dismiss(animated: true, completion: nil)
            }
            
//            self.modelDrinks.append(Drinks(typeDrink: userType, amountDrink: userAmount))
        }
        
        let cupWaterAction = UIAlertAction(title: "Adding 1 cup of water in \(modelRoutine.weekday)", style: .default) { (action) in
            
            var userType: String = ""
            var userAmount: String = ""
            var userHour: String = ""
            
            if let type = custom_type?.text {
                print(type)
                userType = "water"
                print(userType)
                // Save data do CoreData
            }else {
                alertController.dismiss(animated: true, completion: nil)
            }
            if let amt = custom_amount?.text {
                print(amt)
                userAmount = "200.0"
                print(userAmount)
                // Save data do CoreData
                //self.waterlog.addAmount(amount: userAmount)
                //_ = self.updateTotalAmount()
            }else {
                alertController.dismiss(animated: true, completion: nil)
            }
            if let hour = custom_hour?.text {
                print(hour)
                userHour = hour
                print(userHour)
                // Save data do CoreData
                //self.waterlog.addAmount(amount: userAmount)
                //_ = self.updateTotalAmount()
            } else {
                alertController.dismiss(animated: true, completion: nil)
            }
//            self.modelDrinks.append(Drinks(typeDrink: userType, amountDrink: userAmount))
        }
        
        
        alertController.addTextField { (type) in
            custom_type = type
            custom_type!.placeholder = "type, e.g, water, coffee, tea, wine"
            custom_type!.keyboardType = .default
        }
        
        alertController.addTextField { (amt) in
            custom_amount = amt
            custom_amount!.placeholder = "amount, e.g., 200ml or 16 fl oz"
            custom_amount!.keyboardType = .numberPad
        }
        alertController.addTextField { (hour) in
            custom_hour = hour
            custom_hour!.placeholder = "hour"
            custom_hour!.keyboardType = .numberPad
        }
        
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            alertController.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(drinkAction)
        alertController.addAction(cupWaterAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    
    func showAlertSimple() {
        // Create the action buttons for the alert.
        let defaultAction = UIAlertAction(title: "Agree",
                                          style: .default) { (action) in
                                            // Respond to user selection of the action.
        }
        let cancelAction = UIAlertAction(title: "Disagree",
                                         style: .cancel) { (action) in
                                            // Respond to user selection of the action.
        }
        
        // Create and configure the alert controller.
        let alert = UIAlertController(title: "Terms and Conditions",
                                      message: "Click Agree to accept the terms and conditions.",
                                      preferredStyle: .alert)
        alert.addAction(defaultAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true) {
            // The alert was presented
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getData()
        if let index = self.routineTableView.indexPathForSelectedRow {
            self.routineTableView.deselectRow(at: index, animated: true)
        }
        addDrink.setTitle("Add drink in \(modelRoutine.weekday)", for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        if let index = self.routineTableView.indexPathForSelectedRow {
            self.routineTableView.deselectRow(at: index, animated: true)
        }
        addDrink.setTitle("Add drink in \(modelRoutine.weekday)", for: .normal)
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

extension RoutineViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelDrinks.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            modelDrinks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = routineTableView.dequeueReusableCell(withIdentifier: "RoutineTableCell") as? RoutineTableViewCell

        let allDrinks = modelDrinks[indexPath.row]

        cell?.amountDrink.text = "(\(allDrinks.amountDrink))"
        cell?.hourDrink.text = allDrinks.hourDrink
        cell?.typeDrink.text = allDrinks.typeDrink
        switch cell?.typeDrink.text {
        case "water":
            cell?.drinkImage.image = UIImage(named: "water")
        case "coffee":
            cell?.drinkImage.image = UIImage(named: "coffee")
        case "wine":
            cell?.drinkImage.image = UIImage(named: "wine")
        case "beer":
            cell?.drinkImage.image = UIImage(named: "beer")
        default:
            print("default images")
        }

        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = routineTableView.dequeueReusableCell(withIdentifier: "RoutineTableCell") as? RoutineTableViewCell
        
        
    }
    
    
}
