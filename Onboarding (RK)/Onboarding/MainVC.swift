//
//  MainVC.swift
//  Onboarding
//
//  Created by Stella Cho on 10/6/17.
//  Copyright © 2017 Stella Cho. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    
    @IBOutlet weak var welcomeLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = UserDefaults.standard.value(forKey: "name"){
        welcomeLabel.text = "Welcome, \(name)!"
        
        // Do any additional setup after loading the view, typically from a nib.
    }

   

}

}
