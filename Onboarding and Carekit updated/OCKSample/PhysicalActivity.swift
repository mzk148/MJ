//
//  PhysicalActivity.swift
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
struct PhysicalActivity: Assessment {
    // MARK: Activity
    
    let activityType: ActivityType = .physicalActivity
    
    func carePlanActivity() -> OCKCarePlanActivity {
        // Create a weekly schedule.
        let startDate = DateComponents(year: 2016, month: 01, day: 01)
        let schedule = OCKCareSchedule.weeklySchedule(withStartDate: startDate as DateComponents, occurrencesOnEachDay: [1, 1, 1, 1, 1, 1, 1])
        let thresholds = [OCKCarePlanThreshold.numericThreshold(withValue: NSNumber.init(value: 3), type: .numericLessThanOrEqual, upperValue: nil, title: "Let's get more active!")] as Array<OCKCarePlanThreshold>;
        
        // Get the localized strings to use for the assessment.
        let title = NSLocalizedString("Physical Activity", comment: "")
        
        
        let activity = OCKCarePlanActivity.assessment(
            withIdentifier: activityType.rawValue,
            groupIdentifier: "Physical Activity",
            title: title,
            text: nil,
            tintColor: Colors.blue.color,
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
        let question = NSLocalizedString("How much did you perform physical acitivities yesterday? 0 means you did not perform any physical activity; 10 means you performed highly intense physical activities; 5 means the same as usual.", comment: "")
        let maximumValueDescription = NSLocalizedString("Highly intense", comment: "")
        let minimumValueDescription = NSLocalizedString("None", comment: "")
        
        // Create a question and answer format.
        let answerFormat = ORKScaleAnswerFormat(
            maximumValue: 10,
            minimumValue: 0,
            defaultValue: 5,
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


