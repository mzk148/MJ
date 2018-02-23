//
//  MorningMedication.swift
//  OCKSample
//
//  Created by Stella Cho on 2/1/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import CareKit
import ResearchKit

/**
 Struct that conforms to the `Activity` protocol to define an activity to take
 medication.
 */
struct MorningMedication: Assessment {
    // MARK: Activity
    
    let activityType: ActivityType = .morningMedication
    
    func carePlanActivity() -> OCKCarePlanActivity {
        // Create a weekly schedule.
        let startDate = DateComponents(year: 2016, month: 01, day: 01)
        let schedule = OCKCareSchedule.weeklySchedule(withStartDate: startDate as DateComponents, occurrencesOnEachDay: [1, 1, 1, 1, 1, 1, 1])
        
        // Get the localized strings to use for the activity.
        let title = NSLocalizedString("Morning Medication", comment: "")
        
        let activity = OCKCarePlanActivity.assessment(
            withIdentifier: activityType.rawValue,
            groupIdentifier: "Check-in",
            title: title,
            text: nil,
            tintColor: Colors.green.color,
            resultResettable: true,
            schedule: schedule,
            userInfo: nil,
            thresholds: nil,
            optional: false
        )
        
        return activity
    }
    
    func task() -> ORKTask {
        // Get the localized strings to use for the task.
        // Create a question.
        let question = NSLocalizedString("How many medications did you take in this morning?", comment: "")
        let questionStep = ORKQuestionStep(identifier: activityType.rawValue, title: question, answer: ORKAnswerFormat.integerAnswerFormat(withUnit: "type(s)"))
        questionStep.isOptional = false
        
        // Create an ordered task with a single question.
        let task = ORKOrderedTask(identifier: activityType.rawValue, steps: [questionStep])
        
        return task
    }
    
}
