//
//  Fitness.swift
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
struct Fitness: Assessment {
    func task() -> ORKTask {
        let task = ORKOrderedTask.fitnessCheck(withIdentifier: "FitnessTask", intendedUseDescription: "This activity monitors your heart rate and measures how far you can walk in 6 minutes", walkDuration: 180.0, restDuration: 90.0, options: [])
        
        return task
    }

    // MARK: Activity
    
    let activityType: ActivityType = .fitness
    
    func carePlanActivity() -> OCKCarePlanActivity {
        // Create a weekly schedule.
        let startDate = DateComponents(year: 2016, month: 01, day: 01)
        let schedule = OCKCareSchedule.weeklySchedule(withStartDate: startDate as DateComponents, occurrencesOnEachDay: [0, 0, 0, 0, 0, 0, 1])
        
        
        // Get the localized strings to use for the assessment.
        let title = NSLocalizedString("Fitness", comment: "")
        let summary = NSLocalizedString("6 minute walk task", comment: "")
        
        let activity = OCKCarePlanActivity.assessment(
            withIdentifier: activityType.rawValue,
            groupIdentifier: "Physical Activity",
            title: title,
            text: summary,
            tintColor: Colors.blue.color,
            resultResettable: true,
            schedule: schedule,
            userInfo: nil,
            thresholds: nil,
            optional: false
        )
        
        return activity
    }
    
}
