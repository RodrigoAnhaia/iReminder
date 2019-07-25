//
//  TutorialViewController.swift
//  iReminder
//
//  Created by Rodrigo de Anhaia on 22/07/19.
//  Copyright © 2019 Giovani Nícolas Bettoni. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    //Data of UIPickerView
    let climateDataPicker = ["Tropical", "Temperate", "Cold"]
    let activityDataPicker = ["Sedentary", "Moderate", "Active", "Very Active"]
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var btnGetStarted: UIButton!
  
    
    var scrollWidth: CGFloat! = 0
    var scrollHeigt: CGFloat! = 0
    
    var climeTextField: UITextField!
    var climePicker: UIPickerView!
    
    var activityTextField: UITextField!
    var activityPicker: UIPickerView!
    
    //Data for slides
    
    var titles = ["FAST DELIVERY", "EXCINTING OFFERS", "SECURE PAYMENT", "Choose your activity level" ,"Choose your clime"]
    var descs = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit.", "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", "This is influence the amount of water to be ingested.","Your type of climate may influence the amount of water to be ingested."]
    var imgs = ["intro1", "intro2", "intro3", "actT","lastT"]

    //Get dynamic width and height of scrollview and save it
    
    override func viewDidLayoutSubviews() {
        
        scrollWidth = scrollView.frame.size.width
        scrollHeigt = scrollView.frame.size.height
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.layoutIfNeeded()
        
        //Try to set gradient on button Onboarding

        
        //to call viewDidLayoutSubviews() and get dynamic width and height of scrollview
        self.scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
        //Create the slides an add them
        
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        for index in 0..<titles.count {
            frame.origin.x = scrollWidth * CGFloat(index)
            frame.size = CGSize(width: scrollWidth, height: scrollHeigt)
            
            let slide = UIView(frame: frame)
            
            //Subviews
            
            let imageViews = UIImageView.init(image: UIImage.init(named: imgs[index]))
            
            imageViews.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
            imageViews.contentMode = .scaleAspectFit
            imageViews.center = CGPoint(x: scrollWidth/2, y: scrollHeigt/2 - 100)
            
            
            let txt1 = UILabel.init(frame: CGRect(x: 32, y: imageViews.frame.maxY+30, width: scrollWidth-64, height: 30))
            
            txt1.textAlignment = .center
            txt1.font = UIFont.boldSystemFont(ofSize: 20.0)
            txt1.text = titles[index]
            
            let txt2 = UILabel.init(frame: CGRect(x: 32, y: txt1.frame.maxY+10, width: scrollWidth-64, height: 50))
            
            txt2.textAlignment = .center
            txt2.numberOfLines = 3
            txt2.font = UIFont.systemFont(ofSize: 18.0)
            txt2.text = descs[index]
            
            
            slide.addSubview(imageViews)
            slide.addSubview(txt1)
            slide.addSubview(txt2)
            scrollView.addSubview(slide)
            
        }
        
        for index in 0..<titles.count {
            frame.origin.x = scrollWidth * CGFloat(index)
            frame.size = CGSize(width: scrollWidth, height: scrollHeigt)
            
            
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
            
            
            let title = titles[index]
            if title.contains("Choose your clime")  {
            
                //Create PickerView and TextField for option Clime
                let slide = UIView(frame: frame)
                climeTextField = UITextField(frame: CGRect(x: 32, y: 450, width: scrollWidth-64, height: 40))
                climePicker = UIPickerView(frame: CGRect(x: 32, y: 80, width: scrollWidth-64, height: 170))
                
                
                climeTextField.delegate = self
                climePicker.dataSource = self
                climePicker.delegate = self
                climePicker.showsSelectionIndicator = true
                
                //Configuration of elements
                climeTextField.backgroundColor = .white
                climePicker.backgroundColor = #colorLiteral(red: 0.7803921569, green: 0.9529411765, blue: 1, alpha: 1)
                climePicker.setValue(UIColor(cgColor: #colorLiteral(red: 0.2387163937, green: 0.4426490664, blue: 0.5015435219, alpha: 1)), forKey: "textColor")
                climeTextField.textColor = #colorLiteral(red: 0.2392156863, green: 0.4431372549, blue: 0.5019607843, alpha: 1)
                
                climeTextField.attributedText = NSAttributedString(string: "Select Clime", attributes: [.paragraphStyle: paragraphStyle])
                climeTextField.layer.cornerRadius = 10.0
                climeTextField.inputView = climePicker
                climeTextField.inputAccessoryView = toolBar
                
                slide.addSubview(climeTextField)
                scrollView.addSubview(slide)
                
            } else if title.contains("Choose your activity level") {
                
                //Create PickerView and TextField for option Active
                let slide = UIView(frame: frame)
                activityTextField = UITextField(frame: CGRect(x: 32, y: 450, width: scrollWidth-64, height: 40))
                activityPicker = UIPickerView(frame: CGRect(x: 32, y: 80, width: scrollWidth-64, height: 170))
                
                //Delegate of components for screens
                
                activityTextField.delegate = self
                activityPicker.dataSource = self
                activityPicker.delegate = self
                activityPicker.showsSelectionIndicator = true
                
                //Configuration of elements
                activityTextField.backgroundColor = .white
                activityPicker.backgroundColor = #colorLiteral(red: 0.7803921569, green: 0.9529411765, blue: 1, alpha: 1)
                activityPicker.setValue(UIColor(cgColor: #colorLiteral(red: 0.2387163937, green: 0.4426490664, blue: 0.5015435219, alpha: 1)), forKey: "textColor")
                activityTextField.textColor = #colorLiteral(red: 0.2392156863, green: 0.4431372549, blue: 0.5019607843, alpha: 1)
                
                activityTextField.attributedText = NSAttributedString(string: "Select Level Active", attributes: [.paragraphStyle: paragraphStyle])
                activityTextField.layer.cornerRadius = 10.0
                activityTextField.inputView = activityPicker
                activityTextField.inputAccessoryView = toolBar
                
                slide.addSubview(activityTextField)
                scrollView.addSubview(slide)
            }
            
            
        }
        //Set width of scrollview to accomodate all the slides
        
        scrollView.contentSize = CGSize(width: scrollWidth * CGFloat(titles.count), height: scrollHeigt)
        
        //Disable vertical scroll/bounce
        self.scrollView.contentSize.height = 1.0
        
        //Initial state
        
        pageControl.numberOfPages = titles.count
        pageControl.currentPage = 0
        
    }
    
    
    @objc func doneButton(_ sender: UIButton) {
        
        
        // Tira o teclado
        climeTextField.resignFirstResponder()
        activityTextField.resignFirstResponder()
        
    }
    
    @objc func cancelButton(_ sender: UIButton) {
        climeTextField.resignFirstResponder()
        activityTextField.resignFirstResponder()
    }
    //Indicator
    @IBAction func pageChanged(_sender: Any){
        
        // Salvar clima no CoreData
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(climeTextField.text, forKey: "Clime")
        userDefaults.set(true, forKey: "Pie")
        
        print("Clime")
        
        dismiss(animated: true, completion: nil)
        scrollView!.scrollRectToVisible(CGRect(x: scrollWidth * CGFloat((pageControl?.currentPage)!), y: 0, width: scrollWidth, height: scrollHeigt), animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print(#function)
        setIndiactorForCurrentPage()
    }
    
    func setIndiactorForCurrentPage() {
        
        let page = (scrollView?.contentOffset.x)!/scrollWidth
        pageControl?.currentPage = Int(page)
        
//        print("+++")
//        print("\(pageControl.currentPage)")
//        print("textField \(textField?.description ?? "No Textfield")")
//        print("textField2 \(textField2?.description ?? "No Textfield")")
        if pageControl.currentPage == 3 || pageControl.currentPage == 4 {
            if let textField = climeTextField {
                textField.isHidden = false
                textField.resignFirstResponder()
            }
            if let textField2 = activityTextField {
                textField2.isHidden = false
                textField2.resignFirstResponder()
            }
        } else {
            if let textField = climeTextField {
                textField.isHidden = true
                textField.resignFirstResponder()
            }
            if let textField2 = activityTextField {
                textField2.isHidden = true
                textField2.resignFirstResponder()
            }
        }
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if titles.contains("Choose your clime") {
            return climateDataPicker.count
        } else if titles.contains("Choose your activity level") {
            return activityDataPicker.count
        } else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if titles.contains("Choose your clime") {
            return climateDataPicker[row]
        } else if titles.contains("Choose your activity level") {
            return activityDataPicker[row]
        } else {
            return "ERROR"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if titles.contains("Choose your clime") {
            climeTextField.text = climateDataPicker[row]
        } else if titles.contains("Choose your activity level") {
            activityTextField.text = activityDataPicker[row]
        }
        
    }
    
}
