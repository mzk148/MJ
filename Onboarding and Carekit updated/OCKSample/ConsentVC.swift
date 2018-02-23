//
//  ConsentVC.swift
//  OCKSample
//
//  Created by Stella Cho on 2/1/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import ResearchKit

class ConsentVC: UIViewController {
    
    @IBAction func InformedConsentTapped(_ sender: UIButton) {
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
