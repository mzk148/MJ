//
//  Concentration.swift
//  OCKSample
//
//  Created by Stella Cho on 8/3/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import ResearchKit
import CareKit

/**
 Struct that conforms to the `Assessment` protocol to define a mood
 assessment.
 */
struct Concentration: Assessment {
    // MARK: Activity
    
    let activityType: ActivityType = .concentration
    
    func carePlanActivity() -> OCKCarePlanActivity {
        // Create a weekly schedule.
        let startDate = DateComponents(year: 2016, month: 01, day: 01)
        let schedule = OCKCareSchedule.weeklySchedule(withStartDate: startDate as DateComponents, occurrencesOnEachDay: [1, 1, 1, 1, 1, 1, 1])
        let thresholds = [OCKCarePlanThreshold.numericThreshold(withValue: NSNumber.init(value: 8), type: .numericGreaterThan, upperValue: nil, title: "Contact your doctor."), OCKCarePlanThreshold.numericThreshold(withValue: NSNumber.init(value: 2), type: .numericLessThanOrEqual, upperValue: nil, title: "Keep trying to relax")] as Array<OCKCarePlanThreshold>
        
        // Get the localized strings to use for the assessment.
        let title = NSLocalizedString("Concentration", comment: "")
        let summary = NSLocalizedString("Difficulty in concentrating or decreased alertness", comment: "")
        
        
        let activity = OCKCarePlanActivity.assessment(
            withIdentifier: activityType.rawValue,
            groupIdentifier: "Assessment",
            title: title,
            text: summary,
            tintColor: Colors.green.color,
            resultResettable: true,
            schedule: schedule,
            userInfo: nil,
            thresholds: [thresholds],
            optional: false
        )
        
        return activity
    }
    
    // MARK: Assessment
    
    func task() -> ORKTask {
        // Get the localized strings to use for the task.
        let question = NSLocalizedString("On a scale from 0 to 10, how often did you feel difficulties in concentrating or decreased alertness for the last 24 hours?", comment: "")
        let maximumValueDescription = NSLocalizedString("Always", comment: "")
        let minimumValueDescription = NSLocalizedString("None", comment: "")
        
        // Create a question and answer format.
        let answerFormat = ORKScaleAnswerFormat(
            maximumValue: 10,
            minimumValue: 0,
            defaultValue: 0,
            step: 1,
            vertical: false,
            maximumValueDescription: maximumValueDescription,
            minimumValueDescription: minimumValueDescription
        )
        
        let questionStep = ORKQuestionStep(identifier: activityType.rawValue, title: question, answer: answerFormat)
        questionStep.isOptional = false
        
        // Create an ordered task with a single question.
        let task = ORKOrderedTask(identifier: activityType.rawValue, steps: [questionStep])
        
        return task
    }
}

