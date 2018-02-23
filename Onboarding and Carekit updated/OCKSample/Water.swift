//
//  Water.swift
//  OCKSample
//
//  Created by Stella Cho on 2/1/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import ResearchKit
import CareKit

/**
 Struct that conforms to the `Assessment` protocol to define a mood
 assessment.
 */
struct Water: Assessment {
    // MARK: Activity
    
    let activityType: ActivityType = .water
    
    func carePlanActivity() -> OCKCarePlanActivity {
        // Create a weekly schedule.
        let startDate = DateComponents(year: 2016, month: 01, day: 01)
        let schedule = OCKCareSchedule.weeklySchedule(withStartDate: startDate as DateComponents, occurrencesOnEachDay: [1, 1, 1, 1, 1, 1, 1])
        
        
        // Get the localized strings to use for the assessment.
        let title = NSLocalizedString("Water", comment: "")
        let summary = NSLocalizedString("Water intake", comment: "")
        
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
        let question = NSLocalizedString("How much water did you drink during the last 24 hours?", comment: "")
        let questionStep = ORKQuestionStep(identifier: activityType.rawValue, title: question, answer: ORKAnswerFormat.integerAnswerFormat(withUnit: "mL"))
        questionStep.isOptional = false
        
        // Create an ordered task with a single question.
        let task = ORKOrderedTask(identifier: activityType.rawValue, steps: [questionStep])
        
        return task
    }
}


