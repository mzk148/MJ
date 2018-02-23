//
//  DBP.swift
//  OCKSample
//
//  Created by Stella Cho on 8/3/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import ResearchKit
import CareKit

/**
 Struct that conforms to the `Assessment` protocol to define a blood glucose
 assessment.
 */
struct DBP: Assessment {
    // MARK: Activity
    
    let activityType: ActivityType = .DBP
    
    let quantityType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bloodPressureDiastolic)!
    let unit = HKUnit(from: "mmHg")
    
    func carePlanActivity() -> OCKCarePlanActivity {
        // Create a weekly schedule.
        let startDate = DateComponents(year: 2016, month: 01, day: 01)
        let schedule = OCKCareSchedule.weeklySchedule(withStartDate: startDate as DateComponents, occurrencesOnEachDay: [1, 1, 1, 1, 1, 1, 1])
    
        
        // Get the localized strings to use for the assessment.
        let title = NSLocalizedString("DBP", comment: "")
        let summary = NSLocalizedString("Diastolic blood pressure", comment: "")
        
        let activity = OCKCarePlanActivity.assessment(withIdentifier: activityType.rawValue, groupIdentifier: "Vital Sign", title: title, text: summary, tintColor: Colors.purple.color, resultResettable: true, schedule: schedule, userInfo: nil, optional: true)
        
        return activity
    }
    
    // MARK: Assessment
    
    func task() -> ORKTask {
        // Get the localized strings to use for the task.
        
        let answerFormat = ORKHealthKitQuantityTypeAnswerFormat(quantityType: quantityType, unit: unit, style: .integer)
        
        // Create a question.
        let title = NSLocalizedString("Measure your diastolic blood pressure.", comment: "")
    
        let questionStep = ORKQuestionStep(identifier: activityType.rawValue, title: title, answer: answerFormat)
        questionStep.isOptional = false
        
        // Create an ordered task with a single question.
        let task = ORKOrderedTask(identifier: activityType.rawValue, steps: [questionStep])
        
        return task
    }
    
    func buildSampleWithTaskResult(_ result: ORKTaskResult) -> HKQuantitySample {
        // Get the first result for the first step of the task result.
        guard let firstResult = result.firstResult as? ORKStepResult, let stepResult = firstResult.results?.first else { fatalError("Unexepected task results") }
        
        // Get the numeric answer for the result.
        guard let pressureResult = stepResult as? ORKNumericQuestionResult, let pressureAnswer = pressureResult.numericAnswer else { fatalError("Unable to determine result answer") }
        
        // Create a `HKQuantitySample` for the answer.
        let quantity = HKQuantity(unit: unit, doubleValue: pressureAnswer.doubleValue)
        let now = Date()
        
        return HKQuantitySample(type: quantityType, quantity: quantity, start: now, end: now)
    }
}

