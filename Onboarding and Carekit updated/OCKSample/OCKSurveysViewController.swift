//
//  SurveysViewController.swift
//  OCKSample
//
//  Created by Stella Cho on 8/1/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import ResearchKit
import CareKit

class OCKSurveysViewController: UITableViewController {
    
    
    //Array of dictionaries. Each dictionary contains [ rowTitle : (didSelectRowMethod, resultsProcessingMethod) ]
    var rows : [ [String : ( didSelectMethod:()->(), processResultMethod:(ORKTaskResult?)->()  )] ] = []
    
    var tappedIndexPath : IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewRows()
        
    }
    
    func setupTableViewRows()
    {
        rows += [
            ["Survey" : (didSelectMethod: self.showSurvey, processResultMethod: self.processSurveyResults)]
                    ]
    }
    
    //-----------------------------------------------------------------
    // MARK: TableView Datasource & Delegate
    //-----------------------------------------------------------------
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RKTaskRow", for: indexPath)
        
        let label = cell.viewWithTag(100) as? UILabel
        
        let rowDict = rows[indexPath.row]
        label?.text = rowDict.keys.first
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let rowDict = rows[indexPath.row]
        tappedIndexPath = indexPath
        if let tuple = rowDict.values.first
        {
            tuple.didSelectMethod()
        }
        
    }
}

/*********************************************************************************/
//MARK: - ORKTaskViewController Delegate Methods
/*********************************************************************************/
extension OCKSurveysViewController : ORKTaskViewControllerDelegate
{
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?)
    {
        if reason == .completed
        {
            if let indexPath = tappedIndexPath
            {
                let rowDict = rows[indexPath.row]
                if let tuple = rowDict.values.first
                {
                    tuple.processResultMethod(taskViewController.result)
                }
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
}


