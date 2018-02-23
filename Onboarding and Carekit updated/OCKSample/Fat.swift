//
//  Fat.swift
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
struct Fat: Assessment {
    // MARK: Activity
    
    let activityType: ActivityType = .fat
    
    func carePlanActivity() -> OCKCarePlanActivity {
        // Create a weekly schedule.
        let startDate = DateComponents(year: 2016, month: 01, day: 01)
        let schedule = OCKCareSchedule.weeklySchedule(withStartDate: startDate as DateComponents, occurrencesOnEachDay: [1, 1, 1, 1, 1, 1, 1])
        
        
        // Get the localized strings to use for the assessment.
        let title = NSLocalizedString("Fat", comment: "")
        let summary = NSLocalizedString("Fat and cholesterol intake", comment: "")
        
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
        let question = NSLocalizedString("This question ask you to rate how much you ate a diet high in saturated fat and cholesterol from 0 to 10 scale yesterday. 0 means you did not limit saturated fat and cholesterol intake and ate them as much as you want, while 10 means you did not take saturated fat and cholesterol at all.", comment: "")
        let maximumValueDescription = NSLocalizedString("Not at all", comment: "")
        let minimumValueDescription = NSLocalizedString("Super fatty", comment: "")
        
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


