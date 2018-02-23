//
//  MobileDevice.swift
//  OCKSample
//
//  Created by Stella Cho on 2/1/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import CareKit
import ResearchKit

struct MobileDevice: Assessment {
    // MARK: Activity
    
    let activityType: ActivityType = .mobileDevice
    
    func carePlanActivity() -> OCKCarePlanActivity {
        // Create a weekly schedule.
        let startDate = DateComponents(year: 2016, month: 01, day: 01)
        let schedule = OCKCareSchedule.weeklySchedule(withStartDate: startDate as DateComponents, occurrencesOnEachDay: [1, 1, 1, 1, 1, 1, 1])
        
        // Get the localized strings to use for the assessment.
        let title = NSLocalizedString("Mobile Device Usage", comment: "")
        
        
        let activity = OCKCarePlanActivity.assessment(
            withIdentifier: activityType.rawValue,
            groupIdentifier: "Physical Activity",
            title: title,
            text: nil,
            tintColor: Colors.blue.color,
            resultResettable: true,
            schedule: schedule,
            userInfo: nil,
            thresholds: nil,
            optional: false
        )
        
        return activity
    }
    
    // MARK: Assessment
    
    func task() -> ORKTask {
        // Get the localized strings to use for the task.
        let question = NSLocalizedString("During the last 24 hours, how often did you have your phone or wearable device with you? (Keeping it on you will provide our study more accurate level of your daily activity.) ", comment: "")
        let maximumValueDescription = NSLocalizedString("All the time", comment: "")
        let minimumValueDescription = NSLocalizedString("About a half of the time", comment: "")
        
        // Create a question and answer format.
        let answerFormat = ORKScaleAnswerFormat(
            maximumValue: 2,
            minimumValue: 0,
            defaultValue: 1,
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


