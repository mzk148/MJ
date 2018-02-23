//
//  MainVC.swift
//  ResearchKit
//
//  Created by Stella Cho on 2/1/18.
//  Copyright © 2018 researchkit.org. All rights reserved.
//

import UIKit
import CareKit

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
