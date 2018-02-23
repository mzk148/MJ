//
//  OnboardingVC.swift
//  OCKSample
//
//  Created by Stella Cho on 2/1/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class OnboardingVC: UIViewController {
    
    
    @IBAction func NextTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toConsentSegue", sender: self)
    }
}
