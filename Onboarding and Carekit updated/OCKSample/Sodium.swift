//
//  Sodium.swift
//  OCKSample
//
//  Created by Stella Cho on 8/4/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import ResearchKit
import CareKit

/**
 Struct that conforms to the `Assessment` protocol to define a mood
 assessment.
 */
struct Sodium: Assessment {
    // MARK: Activity
    
    let activityType: ActivityType = .sodium
    
    func carePlanActivity() -> OCKCarePlanActivity {
        // Create a weekly schedule.
        let startDate = DateComponents(year: 2016, month: 01, day: 01)
        let schedule = OCKCareSchedule.weeklySchedule(withStartDate: startDate as DateComponents, occurrencesOnEachDay: [1, 1, 1, 1, 1, 1, 1])
        
        
        // Get the localized strings to use for the assessment.
        let title = NSLocalizedString("Sodium", comment: "")
        let summary = NSLocalizedString("Salt or sodium intake", comment: "")
        
        let activity = OCKCarePlanActivity.assessment(
            withIdentifier: activityType.rawValue,
            groupIdentifier: "Food Log",
            title: title,
            text: summary,
            tintColor: Colors.pink.color,
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
        let question = NSLocalizedString("How much salt did you take during the last 24 hours?", comment: "")
        let questionStep = ORKQuestionStep(identifier: activityType.rawValue, title: question, answer: ORKAnswerFormat.integerAnswerFormat(withUnit: "mg"))
        questionStep.isOptional = false
        
        // Create an ordered task with a single question.
        let task = ORKOrderedTask(identifier: activityType.rawValue, steps: [questionStep])
        
        return task
    }
}


