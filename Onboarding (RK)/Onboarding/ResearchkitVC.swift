//
//  ResearchkitVC.swift
//  Onboarding
//
//  Created by Stella Cho on 10/19/17.
//  Copyright © 2017 Stella Cho. All rights reserved.
//

import UIKit
import ResearchKit

class ResearchkitVC: UIViewController {
   
    
    
    @IBAction func SurveyTapped(_ sender: UIButton) {
        let taskViewController = ORKTaskViewController(task: SurveyTask, taskRun: nil)
        taskViewController.delegate = self as ORKTaskViewControllerDelegate
        present(taskViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func BackgroundTapped(_ sender: UIButton) {
        let taskViewController = ORKTaskViewController(task: OnboardingTask, taskRun: nil)
        taskViewController.delegate = self as ORKTaskViewControllerDelegate
        present(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func DepressionTapped(_ sender: UIButton) {
        let taskViewController = ORKTaskViewController(task: PHQ9Task, taskRun: nil)
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
