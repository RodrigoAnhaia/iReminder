//
//  ProfileViewController.swift
//  iReminder
//
//  Created by Rodrigo de Anhaia on 30/07/19.
//  Copyright © 2019 Giovani Nícolas Bettoni. All rights reserved.
//

import Photos
import UserNotifications
import UIKit

class ProfileViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    let defaults = UserDefaults.standard
    
    let genderPickerData = ["Not Set", "Male", "Female", "Other"]
    let climeDataPickerData = ["Tropical", "Temperate", "Cold"]
    let activityDataPickerData = ["Sedentary", "Moderate", "Active", "Very Active"]
    
    var genderPicker: UIPickerView!
    var climePicker: UIPickerView!
    var activityPicker: UIPickerView!
    
    
    var pickerWidth: CGFloat! = 0
    var pickerHeigt: CGFloat! = 0
    
    @IBOutlet weak var viewPickers: UIView!
    @IBOutlet weak var saveProfileOutBTN: UIBarButtonItem!
    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var profileNameTxtFd: UITextField!
    @IBOutlet weak var profileWeightTxtFd: UITextField!
    @IBOutlet weak var profileHeightTxtFd: UITextField!
    @IBOutlet weak var profileAgeTxtFd: UITextField!
    @IBOutlet weak var profileSexTxtFd: UITextField!
    @IBOutlet weak var profileActLvlTxtFd: UITextField!
    @IBOutlet weak var profileClimeTxtFd: UITextField!
    
    var modelProfile: Profile = Profile(image: "test", name: "", weight: "", height: "", age: "", biologicalSex: "", activyLevel: "", clime: "")

    override func viewDidLayoutSubviews() {
    
        pickerWidth = viewPickers.frame.size.width
        pickerHeigt = viewPickers.frame.size.height
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.layoutIfNeeded()
        
        createPicker()
     
        
        profileNameTxtFd.delegate = self
        profileWeightTxtFd.delegate = self
        profileHeightTxtFd.delegate = self
        profileAgeTxtFd.delegate = self
        profileSexTxtFd.delegate = self
        profileActLvlTxtFd.delegate = self
        profileClimeTxtFd.delegate = self
        
        genderPicker.delegate = self
        climePicker.delegate = self
        activityPicker.delegate = self
        
        genderPicker.dataSource = self
        climePicker.dataSource = self
        activityPicker.dataSource = self
        
        
        genderPicker.showsSelectionIndicator = true
        climePicker.showsSelectionIndicator = true
        activityPicker.showsSelectionIndicator = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getData()
       
    }
    
    func createPicker() {
        
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        genderPicker = UIPickerView(frame: CGRect(x: 32, y: 80, width: pickerWidth-64, height: 170))
        activityPicker = UIPickerView(frame: CGRect(x: 32, y: 80, width: pickerWidth-64, height: 170))
        climePicker = UIPickerView(frame: CGRect(x: 32, y: 80, width: pickerWidth-64, height: 170))
        
        //Picker init
        profileSexTxtFd.inputView = genderPicker
        profileActLvlTxtFd.inputView = activityPicker
        profileClimeTxtFd.inputView = climePicker
        
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
        
        profileSexTxtFd.inputAccessoryView = toolBar
        profileActLvlTxtFd.inputAccessoryView = toolBar
        profileClimeTxtFd.inputAccessoryView = toolBar

    }
    func getData() {
//        profileImgView.image = data
        profileNameTxtFd.text = defaults.string(forKey: "name")
        profileWeightTxtFd.text = defaults.string(forKey: "weight")
        profileHeightTxtFd.text = defaults.string(forKey: "height")
        profileAgeTxtFd.text = defaults.string(forKey: "age")
        profileSexTxtFd.text = defaults.string(forKey: "biologicalSex")
        profileActLvlTxtFd.text = defaults.string(forKey: "activyLevel")
        profileClimeTxtFd.text = defaults.string(forKey: "clime")
    }
    
    @IBAction func saveProfileActBtn(_ sender: Any) {
        modelProfile.name = profileNameTxtFd.text!
        modelProfile.weight = profileWeightTxtFd.text!
        modelProfile.height = profileHeightTxtFd.text!
        modelProfile.age = profileAgeTxtFd.text!
        modelProfile.biologicalSex = profileSexTxtFd.text!
        modelProfile.activyLevel = profileActLvlTxtFd.text!
        modelProfile.clime = profileClimeTxtFd.text!
        
        defaults.set(modelProfile.name, forKey: "name")
        defaults.set(modelProfile.weight, forKey: "weight")
        defaults.set(modelProfile.height, forKey: "height")
        defaults.set(modelProfile.age, forKey: "age")
        defaults.set(modelProfile.biologicalSex, forKey: "biologicalSex")
        defaults.set(modelProfile.activyLevel, forKey: "activyLevel")
        defaults.set(modelProfile.clime, forKey: "clime")
        
    }
   
    
    @objc func doneButton(_ sender: UIButton) {
        
        
        // Tira o teclado
        profileSexTxtFd.resignFirstResponder()
        profileClimeTxtFd.resignFirstResponder()
        profileActLvlTxtFd.resignFirstResponder()
    }
    
    @objc func cancelButton(_ sender: UIButton) {
        profileSexTxtFd.resignFirstResponder()
        profileClimeTxtFd.resignFirstResponder()
        profileActLvlTxtFd.resignFirstResponder()
    }

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == genderPicker {
            return genderPickerData[row]
        } else if pickerView == climePicker  {
            return climeDataPickerData[row]
        } else if pickerView == activityPicker{
            return activityDataPickerData[row]
        }
        return "Erro"
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == genderPicker {
            return genderPickerData.count
        } else if pickerView == climePicker  {
            return climeDataPickerData.count
        } else if pickerView == activityPicker{
            return activityDataPickerData.count
        }else{
            return 0
        }
    }
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            if pickerView == genderPicker {
                profileSexTxtFd.text = genderPickerData[row]
            } else if pickerView == climePicker  {
                profileClimeTxtFd.text = climeDataPickerData[row]
            } else if pickerView == activityPicker{
                profileActLvlTxtFd.text = activityDataPickerData[row]
            }
    }
    @IBAction func btnImageProfile(_ sender: Any) {
        showAlert()
        
        
    }
    
    //Show alert
    func showAlert() {
        
        let alert = UIAlertController(title: "Choose your photo profile source.", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action: UIAlertAction) in
            self.getImage(fromSourceType: .camera)
        }))
        alert.addAction(UIAlertAction(title: "Photo Album", style: .default, handler: {(action: UIAlertAction) in
            self.getImage(fromSourceType: .photoLibrary)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //get image from source type
    func getImage(fromSourceType sourceType: UIImagePickerController.SourceType) {
        
        //Check is source type available
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {

            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = sourceType
            imagePickerController.allowsEditing = true
            imagePickerController.cameraCaptureMode = .photo
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
//        profileImage.image = image
//        let imageData = image
        profileImgView.image = image
        self.dismiss(animated: true, completion: nil)
    }
    
}
