//
//  Minnesota.swift
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
struct Minnesota: Assessment {
    func task() -> ORKTask {
        let instStep = ORKInstructionStep(identifier: "Instruction Step")
        instStep.title = "Living with Heart Failure"
        instStep.detailText = "This survey demonstrates different question types about how your heart condition affects your physiology and psychology."
        
        let question1 = ORKQuestionStep(identifier: "question 1", title: "Have you ever been diagnosed with any cardiac disease?", answer: ORKAnswerFormat.booleanAnswerFormat())
        
        let question2 = ORKQuestionStep(identifier: "question 2", title: "How much does your medical care cost?", answer: ORKAnswerFormat.integerAnswerFormat(withUnit: "Dollars per year"))
        
        let answerFormat3 = ORKNumericAnswerFormat.scale(withMaximumValue: 5, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Very much", minimumValueDescription: "Not at all")
        let question3 = ORKQuestionStep(identifier: "question 3", title: "Do you experience short of breath everyday?", answer: answerFormat3)
        
        let answerFormat4 = ORKNumericAnswerFormat.scale(withMaximumValue: 5, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Very much", minimumValueDescription: "Not at all")
        let question4 = ORKQuestionStep(identifier: "question 4", title: "Do you get tired, fatigued, or low on energy everyday?", answer: answerFormat4)
        
        let answerFormat5 = ORKNumericAnswerFormat.dateAnswerFormat()
        let question5 = ORKQuestionStep(identifier: "question 5", title: "When was your last hospital visit?", answer: answerFormat5)
        
        let answerFormat6 = ORKNumericAnswerFormat.scale(withMaximumValue: 5, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Very much", minimumValueDescription: "Not at all")
        let question6 = ORKQuestionStep(identifier: "question 6", title: "Are you having any difficulty to concentrate or remember things?", answer: answerFormat6)
        
        let answerFormat7 = ORKNumericAnswerFormat.scale(withMaximumValue: 5, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Very much", minimumValueDescription: "Not at all")
        let question7 = ORKQuestionStep(identifier: "question 7", title: "Do you feel a loss of self-control in your life?", answer: answerFormat7)
        
        let completionStep = ORKCompletionStep(identifier: "Completion Step")
        completionStep.title = "Thank you for taking this survey!"
        
        let task = ORKOrderedTask(identifier: "first survey", steps: [instStep, question1, question2, question3, question4, question5, question6, question7, completionStep])
        
            
        return task
    }

    
    // MARK: Activity
    
    let activityType: ActivityType = .minnesota
    
    func carePlanActivity() -> OCKCarePlanActivity {
        // Create a weekly schedule.
        let startDate = DateComponents(year: 2016, month: 01, day: 01)
        let schedule = OCKCareSchedule.weeklySchedule(withStartDate: startDate as DateComponents, occurrencesOnEachDay: [0, 0, 0, 0, 0, 0, 1])
        
        
        // Get the localized strings to use for the assessment.
        let title = NSLocalizedString("Survey", comment: "")
        let summary = NSLocalizedString("Mandatory monthly survey", comment: "")
        
        let activity = OCKCarePlanActivity.assessment(
            withIdentifier: activityType.rawValue,
            groupIdentifier: "Survey",
            title: title,
            text: summary,
            tintColor: Colors.yellow.color,
            resultResettable: true,
            schedule: schedule,
            userInfo: nil,
            thresholds: nil,
            optional: false
        )
        
        return activity
    }
    
}

