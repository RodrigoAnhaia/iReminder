//
//  SettingsViewController.swift
//  iReminder
//
//  Created by Giovani Nícolas Bettoni on 23/07/19.
//  Copyright © 2019 Giovani Nícolas Bettoni. All rights reserved.
//

import UIKit

struct Profile {
    let name: String
    var weight: String
    var height: String
    var age: String
}



class SettingsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var editProfile: String = ""
    var weekdays: String = ""
    var modelProfile: Profile = Profile(name: "Giovani Nícolas Bettoni", weight: "184", height: "90", age: "22")
    
    let cellsInSection = [["Profile Informations", "Drinking Pattern", "Health Information", "Notifications"], ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]]
    let sections: [String] = ["Edit Profile", "Routine"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
            editProfile = cellsInSection[0][indexPath.row]
            cell?.textLabel?.text = editProfile
            return cell!
        // Routines
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell")
            //print(cellsInSection[1][indexPath.row])
            weekdays = cellsInSection[1][indexPath.row]
            cell?.textLabel?.text = weekdays
            return cell!
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            performSegue(withIdentifier: "EditProfileSegue", sender: editProfile)
        case 1:
            performSegue(withIdentifier: "RoutineSegue", sender: weekdays)
        default:
            print("default")
        }
    }
    
    
}
