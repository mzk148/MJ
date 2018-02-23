//
//  Tylenol.swift
//  OCKSample
//
//  Created by Stella Cho on 2/8/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import CareKit

/**
 Struct that conforms to the `Activity` protocol to define an activity to take
 medication.
 */
struct Tylenol: Activity {
    // MARK: Activity
    
    let activityType: ActivityType = .tylenol
    
    func carePlanActivity() -> OCKCarePlanActivity {
        // Create a weekly schedule.
        let startDate = DateComponents(year: 2016, month: 01, day: 01)
        let schedule = OCKCareSchedule.weeklySchedule(withStartDate: startDate as DateComponents, occurrencesOnEachDay: [2, 2, 2, 2, 2, 2, 2])
        
        // Get the localized strings to use for the activity.
        let title = NSLocalizedString("Tylenol", comment: "")
        let instructions = NSLocalizedString("Take with food.", comment: "")
        
        let activity = OCKCarePlanActivity.intervention(
            withIdentifier: activityType.rawValue,
            groupIdentifier: "Medications",
            title: title,
            text: nil,
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

