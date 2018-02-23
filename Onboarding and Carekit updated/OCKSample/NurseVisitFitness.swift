//
//  NurseVisitFitness.swift
//  OCKSample
//
//  Created by Stella Cho on 2/1/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation
import ResearchKit

public var NurseVisitFitnessTask: ORKOrderedTask{
    
    /*extension NurseVisitVC
     {
     func showFitnessTask()
     {
     let taskViewController = ORKTaskViewController(task: fitnessTask(), taskRun: nil)
     taskViewController.delegate = self
     
     let defaultFileManager = FileManager.default
     let documentDirectoryURL = defaultFileManager.urls(for: .documentDirectory, in: .userDomainMask)
     taskViewController.outputDirectory = documentDirectoryURL.first!
     
     present(taskViewController, animated: true, completion: nil)
     }*/
    
    return ORKOrderedTask.fitnessCheck(withIdentifier: "FitnessTask", intendedUseDescription: "This activity monitors your heart rate and measures how far you can walk in 6 minutes", walkDuration: 180.0, restDuration: 90.0, options: .excludeHeartRate)
    
    
}

