//
//  SettingsViewController.swift
//  iReminder
//
//  Created by Giovani Nícolas Bettoni on 23/07/19.
//  Copyright © 2019 Giovani Nícolas Bettoni. All rights reserved.
//

import UIKit
import HealthKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var editProfile: [String] = []
    var weekdays: [String] = []
    var units: [String] = []
    
    let cellsInSection = [["Profile and Health Informations", "Display", "Sound and Notifications"], ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"], ["ml", "fl oz"]]
    let sections: [String] = ["General", "Routine", "Units"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }

}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellsInSection[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        // Edit Profile
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell")
            //print(cellsInSection[0][indexPath.row])
            editProfile.append(cellsInSection[0][indexPath.row])
            cell?.textLabel?.text = editProfile[indexPath.row]
            return cell!
        // Routines
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell")
            //print(cellsInSection[1][indexPath.row])
            weekdays.append(cellsInSection[1][indexPath.row])
            cell?.textLabel?.text = weekdays[indexPath.row]
            return cell!
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell")
            //print(cellsInSection[1][indexPath.row])
            units.append(cellsInSection[2][indexPath.row])
            cell?.textLabel?.text = units[indexPath.row]
            return cell!
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        // Edit Profile
        case 0:
            switch indexPath.row {
                // Profile
                case 0:
                    print(editProfile[indexPath.row])
                // Themes
                case 1:
                    print(editProfile[indexPath.row])
                default:
                    print(editProfile[indexPath.row])
            }
        
        // Routines
        case 1:
            performSegue(withIdentifier: "RoutineSegue", sender: weekdays[indexPath.row])
        // Units
        case 2:
            print("Exibir um alerta para recalcular unidades")
        
        default:
            print("default")
        }
    }
    
    
}
