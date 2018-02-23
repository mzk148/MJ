//
//  NurseVisitVC.swift
//  Onboarding
//
//  Created by Stella Cho on 1/18/18.
//  Copyright © 2018 Stella Cho. All rights reserved.
//

import UIKit
import ResearchKit
import Foundation

class NurseVisitVC: UIViewController {

    
    @IBAction func NVSurveyTapped(_ sender: UIButton) {
        let taskViewController = ORKTaskViewController(task: NurseVisitSurveyTask, taskRun: nil)
        taskViewController.delegate = self as? ORKTaskViewControllerDelegate
        present(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func NVDepressionTapped(_ sender: UIButton) {
        let taskViewController = ORKTaskViewController(task: NurseVisitDepressionTask, taskRun: nil)
        taskViewController.delegate = self as? ORKTaskViewControllerDelegate
        present(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func NVFitnessTapped(_ sender: UIButton) {
        let taskViewController = ORKTaskViewController(task: NVFitnessTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
        
    }
    
    /*override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NurseVisitVC : ORKTaskViewControllerDelegate {
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?)
    {
        //Handle results with taskViewController.result
        dismiss(animated: true, completion: nil)
    }
}

