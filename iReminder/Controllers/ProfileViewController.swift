//
//  ProfileViewController.swift
//  iReminder
//
//  Created by Rodrigo de Anhaia on 30/07/19.
//  Copyright © 2019 Giovani Nícolas Bettoni. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    let defaults = UserDefaults.standard
    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var profileNameTxtFd: UILabel!
    @IBOutlet weak var viewMaster: UIView!
    
    var viewWidth: CGFloat! = 0
    var viewHeigt: CGFloat! = 0
    
    var weigthLb: UILabel!
    var heightLb: UILabel!
    var ageLb: UILabel!
    var bioSexLb: UILabel!
    
    var weightLabel : UILabel!
    var heightLabel : UILabel!
    var ageLabel : UILabel!
    var bioSexLabel : UILabel!
    
    
    
    var imgs = ["intro1", "intro2", "intro3", "actT","lastT"]
    
    override func viewDidLayoutSubviews() {
        
        viewWidth = view.frame.size.width
        viewHeigt = view.frame.size.height
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.layoutIfNeeded()
        infoProfile()
       
        //viewMaster.addSubview(view)
    }
    
    func infoProfile() {
        
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        weigthLb = UILabel()
        weigthLb.text = "Weigth"
        heightLb = UILabel()
        heightLb.text = "Height"
        ageLb = UILabel()
        ageLb.text = "Age"
        bioSexLb = UILabel()
        bioSexLb.text = "Biological Sex"
        weightLabel = UILabel()
        weightLabel.frame = CGRect(x: 150, y: 0, width: 120, height: 820)
        heightLabel = UILabel()
        heightLabel.frame = CGRect(x: 150, y: 0, width: 140, height: 860)
        ageLabel = UILabel()
        ageLabel.frame = CGRect(x: 150, y: 0, width: 160, height: 900)
        bioSexLabel = UILabel()
        bioSexLabel.frame = CGRect(x: 150, y: 0, width: 180, height: 940)
        weigthLb.frame = CGRect(x: 20, y: 0, width: 120, height: 820)
        heightLb.frame = CGRect(x: 20, y: 0, width: 120, height: 860)
        ageLb.frame = CGRect(x: 20, y: 0, width: 120, height: 900)
        bioSexLb.frame = CGRect(x: 20, y: 0, width: 120, height: 940)
        
        view.addSubview(weightLabel)
        view.addSubview(heightLabel)
        view.addSubview(ageLabel)
        view.addSubview(bioSexLabel)
        view.addSubview(weigthLb)
        view.addSubview(heightLb)
        view.addSubview(ageLb)
        view.addSubview(bioSexLb)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        profileNameTxtFd.text = "Manuel"
        profileImgView.image = UIImage(imageLiteralResourceName: "actT")
        weightLabel.text = "92"
        heightLabel.text = "1.84"
        ageLabel.text = "35"
        bioSexLabel.text = "Men"
    }
   

}
