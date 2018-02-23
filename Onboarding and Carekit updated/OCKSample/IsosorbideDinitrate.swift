//
//  IsosorbideDinitrate.swift
//  OCKSample
//
//  Created by Stella Cho on 8/3/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import CareKit

/**
 Struct that conforms to the `Activity` protocol to define an activity to take
 medication.
 */
struct IsosorbideDinitrate: Activity {
    // MARK: Activity
    
    let activityType: ActivityType = .isosorbideDinitrate
    
    func carePlanActivity() -> OCKCarePlanActivity {
        // Create a weekly schedule.
        let startDate = DateComponents(year: 2016, month: 01, day: 01)
        let schedule = OCKCareSchedule.weeklySchedule(withStartDate: startDate as DateComponents, occurrencesOnEachDay: [1, 1, 1, 1, 1, 1, 1])
        
        // Get the localized strings to use for the activity.
        let title = NSLocalizedString("Isosorbide Dinitrate", comment: "")
        let summary = NSLocalizedString("200mg", comment: "")
        let instructions = NSLocalizedString("Take with food.", comment: "")
        
        let activity = OCKCarePlanActivity.intervention(
            withIdentifier: activityType.rawValue,
            groupIdentifier: "Medications",
            title: title,
            text: summary,
            tintColor: Colors.green.color,
            instructions: instructions,
            imageURL: nil,
            schedule: schedule,
            userInfo: nil,
            optional: false
        )
        
        return activity
    }
}

