//
//  ResearchkitVC.swift
//  OCKSample
//
//  Created by Stella Cho on 2/1/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import ResearchKit

class ResearchkitVC: UIViewController {

    @IBAction func BackgroundSurveyTapped(_ sender: UIButton) {let taskViewController = ORKTaskViewController(task: BackgroundSurveyTask, taskRun: nil)
        taskViewController.delegate = self as ORKTaskViewControllerDelegate
        present(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func MinnesotaSurveyTapped(_ sender: UIButton) {
        let taskViewController = ORKTaskViewController(task: MinnesotaSurveyTask, taskRun: nil)
        taskViewController.delegate = self as ORKTaskViewControllerDelegate
        present(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func DepressionSurveyTapped(_ sender: UIButton) {let taskViewController = ORKTaskViewController(task: DepressionSurveyTask, taskRun: nil)
        taskViewController.delegate = self as ORKTaskViewControllerDelegate
        present(taskViewController, animated: true, completion: nil)
    }
    
}

extension ResearchkitVC : ORKTaskViewControllerDelegate {
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?)
    {
        //Handle results with taskViewController.result
        dismiss(animated: true, completion: nil)
    }
}
