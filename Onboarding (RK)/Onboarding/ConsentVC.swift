//
//  ConsentVC.swift
//  Onboarding
//
//  Created by Stella Cho on 10/27/17.
//  Copyright © 2017 Stella Cho. All rights reserved.
//

import UIKit
import ResearchKit

class ConsentVC: UIViewController {

    @IBAction func nextConsent(_ sender: UIButton) {
        performSegue(withIdentifier: "toOnboardingSegue", sender: self)
    }
    
    @IBAction func ConsentTapped(_ sender: UIButton) {
        let taskViewController = ORKTaskViewController(task: visualConsentTask(), taskRun: nil)
        taskViewController.delegate = self as ORKTaskViewControllerDelegate
        present(taskViewController, animated: true, completion: nil)
    }
    
}

extension ConsentVC : ORKTaskViewControllerDelegate {
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?)
    {
        //Handle results with taskViewController.result
        dismiss(animated: true, completion: nil)
}
}
