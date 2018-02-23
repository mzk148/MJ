//
//  NurseVisitVC.swift
//  OCKSample
//
//  Created by Stella Cho on 2/1/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import ResearchKit
import Foundation

class NurseVisitVC: UIViewController {


    @IBAction func NurseVisitMinnesotaSurveyTapped(_ sender: UIButton) {
        let taskViewController = ORKTaskViewController(task: NurseVisitMinnesotaSurveyTask, taskRun: nil)
        taskViewController.delegate = self as ORKTaskViewControllerDelegate
        present(taskViewController, animated: true, completion: nil)
    }

    @IBAction func NurseVisitDepressionSurveyTapped(_ sender: UIButton) {
        let taskViewController = ORKTaskViewController(task: NurseVisitDepressionSurveyTask, taskRun: nil)
        taskViewController.delegate = self as ORKTaskViewControllerDelegate
        present(taskViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func NurseVisitFitnessTapped(_ sender: UIButton) {
        let taskViewController = ORKTaskViewController(task: NurseVisitFitnessTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }

}

extension NurseVisitVC : ORKTaskViewControllerDelegate {
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?)
    {
        //Handle results with taskViewController.result
        dismiss(animated: true, completion: nil)
    }
}
