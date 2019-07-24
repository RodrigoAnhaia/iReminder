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
    let myDataPicker = ["Tropical", "Temperate", "Cold"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myDataPicker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myDataPicker[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = myDataPicker[row]
    }
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var btnGetStarted: UIButton!
    @IBOutlet weak var btnSignIn: UIButton!
    
    var scrollWidth: CGFloat! = 0
    var scrollHeigt: CGFloat! = 0
    
    var textField: UITextField!
    var picker: UIPickerView!
    
    //Data for slides
    
    var titles = ["FAST DELIVERY", "EXCINTING OFFERS", "SECURE PAYMENT", "Choose your Clime"]
    var descs = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit.", "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",""]
    var imgs = ["intro1", "intro2", "intro3", ""]

    //Get dynamic width and height of scrollview and save it
    
    override func viewDidLayoutSubviews() {
        
        scrollWidth = scrollView.frame.size.width
        scrollHeigt = scrollView.frame.size.height
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.layoutIfNeeded()
        

        //To call viewDidLayoutSubviews() and get dynamic width and height of scrollview
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
            
            imageViews.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
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
        //Create PickerView and TextField for option Clime
        let slide = UIView(frame: frame)
        textField = UITextField(frame: CGRect(x: 32, y: 100, width: scrollWidth-64, height: 40))
        picker = UIPickerView(frame: CGRect(x: 32, y: 80, width: scrollWidth-64, height: 200))
        
        textField.delegate = self
        picker.dataSource = self
        picker.delegate = self
        picker.showsSelectionIndicator = true
        
        let toolBar = UIToolbar()
//        toolBar.backgroundColor = #colorLiteral(red: 0.7803921569, green: 0.9529411765, blue: 1, alpha: 1)
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 61/255, green: 113/255, blue: 128/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(doneButton(_:)))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancelButton(_:)))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        
        textField.backgroundColor = .white
//        picker.backgroundColor = #colorLiteral(red: 0.7803921569, green: 0.9529411765, blue: 1, alpha: 1)
        
        textField.layer.cornerRadius = 10.0
        textField.inputView = picker
        textField.inputAccessoryView = toolBar
        slide.addSubview(textField)
        scrollView.addSubview(slide)
        
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
        textField.resignFirstResponder()
    }
    
    @objc func cancelButton(_ sender: UIButton) {
        textField.resignFirstResponder()
    }
    //Indicator
    @IBAction func pageChanged(_sender: Any){
        
        // Salvar clima no CoreData
        
        dismiss(animated: true, completion: nil)
//        scrollView!.scrollRectToVisible(CGRect(x: scrollWidth * CGFloat((pageControl?.currentPage)!), y: 0, width: scrollWidth, height: scrollHeigt), animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        setIndiactorForCurrentPage()
    }
    
    func setIndiactorForCurrentPage() {
        
        let page = (scrollView?.contentOffset.x)!/scrollWidth
        pageControl?.currentPage = Int(page)
    }
    
    
}
