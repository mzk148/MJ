//
//  OnboardingVC.swift
//  Onboarding
//
//  Created by Stella Cho on 10/6/17.
//  Copyright © 2017 Stella Cho. All rights reserved.
//

import UIKit

class OnboardingVC: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func continueTouched(_ sender: UIButton) {
        
        UserDefaults.standard.set(nameTextField.text, forKey: "name")
        performSegue(withIdentifier: "toResearchkitSegue", sender: self)
        
    }
    
    
    
    
    
}
