/*
 Copyright (c) 2017, Apple Inc. All rights reserved.
 
 Redistribution and use in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:
 
 1.  Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 
 2.  Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation and/or
 other materials provided with the distribution.
 
 3.  Neither the name of the copyright holder(s) nor the names of any contributors
 may be used to endorse or promote products derived from this software without
 specific prior written permission. No license is granted to the trademarks of
 the copyright holders even if such marks are included in this software.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import CareKit

class BuildInsightsOperation: Operation {
    
    // MARK: Properties
    
    var tonightMedicationEvents: DailyEvents?
    
    var afternoonMedicationEvents: DailyEvents?
    
    var morningMedicationEvents: DailyEvents?
    
    var isosorbideDinitrateEvents: DailyEvents?
    
    var betaBlockerEvents: DailyEvents?
    
    var tylenolEvents: DailyEvents?
    
    var sodiumEvents: DailyEvents?
    
    var waterEvents: DailyEvents?
    
    var physicalActivityEvents: DailyEvents?
    
    var mobileDeviceEvents: DailyEvents?
    
    var fitnessEvents: DailyEvents?
    
    var minnesotaEvents: DailyEvents?
    
    var weightEvents: DailyEvents?
    
    var chestPainEvents: DailyEvents?
    
    var heartRateEvents: DailyEvents?
    
    var shortnessOfBreathEvents: DailyEvents?
    
    var edemaEvents: DailyEvents?
    
    var fatigueEvents: DailyEvents?
    
    var sleepingEvents: DailyEvents?
    
    var sleepHoursEvents: DailyEvents?
    
    var concentrationEvents: DailyEvents?
    
    var happinessEvents: DailyEvents?
    
    var depressionEvents: DailyEvents?
    
    var SBPEvents: DailyEvents?
    
    
    
    var stepsEvents: DailyEvents?
    
    fileprivate(set) var insights = [OCKInsightItem.emptyInsightsMessage()]
    
    // MARK: NSOperation
    
    override func main() {
        // Do nothing if the operation has been cancelled.
        guard !isCancelled else { return }
        
        // Create an array of insights.
        var newInsights = [OCKInsightItem]()
        
        if let insight = createCarePlanAdherenceInsight() {
            newInsights.append(insight)
        }
        
        if let insight = createChestPainInsight() {
            newInsights.append(insight)
        }
        
        if let insight = createSleepDepressionInsight() {
            newInsights.append(insight)
        }
        
        // Store any new insights thate were created.
        if !newInsights.isEmpty {
            insights = newInsights
        }
    }
    
    // MARK: Convenience
    
    func createCarePlanAdherenceInsight() -> OCKInsightItem? {
        // Make sure there are events to parse.
        guard let sodiumEvents = sodiumEvents,
            let waterEvents = waterEvents,
            let physicalActivityEvents = physicalActivityEvents,
            let mobileDeviceEvents = mobileDeviceEvents,
            let fitnessEvents = fitnessEvents,
            let minnesotaEvents = minnesotaEvents,
            let afternoonMedicationEvents = afternoonMedicationEvents,
            let morningMedicationEvents = morningMedicationEvents,
            let tonightMedicationEvents = tonightMedicationEvents,
            let isosorbideDinitrateEvents = isosorbideDinitrateEvents,
            let betaBlockerEvents = betaBlockerEvents,
            let tylenolEvents = tylenolEvents,
            let weightEvents = weightEvents,
            let painEvents = chestPainEvents,
            let shortnessOfBreathEvents = shortnessOfBreathEvents,
            let heartRateEvents = heartRateEvents,
            let edemaEvents = edemaEvents,
            let fatigueEvents = fatigueEvents,
            let sleepingEvents = sleepingEvents,
            let sleepHoursEvents = sleepHoursEvents,
            let concentrationEvents = concentrationEvents,
            let happinessEvents = happinessEvents,
            let depressionEvents = depressionEvents,
            let SBPEvents = SBPEvents,
            
            let stepsEvents = stepsEvents
        else { return nil }
        
        // Determine the start date for the previous week.
        let calendar = Calendar.current
        let now = Date()
        
        var components = DateComponents()
        components.day = -7
        let startDate = calendar.weekDatesForDate(calendar.date(byAdding: components as DateComponents, to: now)!).start
        
        var totalEventCount = 0
        var completedEventCount = 0
        
        for offset in 0..<7 {
            components.day = offset
            let dayDate = calendar.date(byAdding: components as DateComponents, to: startDate)!
            let dayComponents = calendar.dateComponents([.year, .month, .day, .era], from: dayDate)
            
            for events in [sodiumEvents, waterEvents, physicalActivityEvents, fitnessEvents, minnesotaEvents, afternoonMedicationEvents, morningMedicationEvents, tonightMedicationEvents, isosorbideDinitrateEvents, betaBlockerEvents,tylenolEvents, mobileDeviceEvents, weightEvents, painEvents, shortnessOfBreathEvents, heartRateEvents, edemaEvents, fatigueEvents, sleepingEvents, sleepHoursEvents, concentrationEvents, happinessEvents, depressionEvents, SBPEvents, stepsEvents] {
                let eventsForDay = events[dayComponents]
                
                totalEventCount += eventsForDay.count
                
                for event in eventsForDay {
                    if event.state == .completed {
                        completedEventCount += 1
                    }
                }
            }
        }
        
        guard totalEventCount > 0 else { return nil }
        
        // Calculate the percentage of completed events.
        let carePlanAdherence = Float(completedEventCount) / Float(totalEventCount)
        
        // Create an `OCKMessageItem` describing medical adherence.
        let percentageFormatter = NumberFormatter()
        percentageFormatter.numberStyle = .percent
        let formattedAdherence = percentageFormatter.string(from: NSNumber(value: carePlanAdherence))!

        let insight = OCKMessageItem(title: "Care Plan Adherence", text: "Your care plan adherence was \(formattedAdherence) last week.", tintColor: Colors.pink.color, messageType: .tip)
        
        return insight
    }
    
    func createChestPainInsight() -> OCKInsightItem? {
        // Make sure there are events to parse.
        guard let isosorbideDinitrateEvents = isosorbideDinitrateEvents, let chestPainEvents = chestPainEvents else { return nil }
        
        // Determine the date to start pain/medication comparisons from.
        let calendar = Calendar.current
        var components = DateComponents()
        components.day = -7
        
        let startDate = calendar.date(byAdding: components as DateComponents, to: Date())!

        // Create formatters for the data.
        let dayOfWeekFormatter = DateFormatter()
        dayOfWeekFormatter.dateFormat = "E"
        
        let shortDateFormatter = DateFormatter()
        shortDateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "Md", options: 0, locale: shortDateFormatter.locale)

        let percentageFormatter = NumberFormatter()
        percentageFormatter.numberStyle = .percent

        /*
            Loop through 7 days, collecting medication adherance and pain scores
            for each.
        */
        var isosorbideDinitrateValues = [Float]()
        var isosorbideDinitrateLabels = [String]()
        var painValues = [Int]()
        var painLabels = [String]()
        var axisTitles = [String]()
        var axisSubtitles = [String]()
        
        for offset in 0..<7 {
            // Determine the day to components.
            components.day = offset
            let dayDate = calendar.date(byAdding: components as DateComponents, to: startDate)!
            let dayComponents = calendar.dateComponents([.year, .month, .day, .era], from: dayDate)
            
            // Store the pain result for the current day.
            if let result = chestPainEvents[dayComponents].first?.result, let score = Int(result.valueString) , score > 0 {
                painValues.append(score)
                painLabels.append(result.valueString)
            }
            else {
                painValues.append(0)
                painLabels.append(NSLocalizedString("N/A", comment: ""))
            }
            
            // Store the medication adherance value for the current day.
            let isosorbideDinitrateEventsForDay = isosorbideDinitrateEvents[dayComponents]
            if let isosorbideDinitratePercentage = percentageEventsCompleted(isosorbideDinitrateEventsForDay) , isosorbideDinitratePercentage > 0.0 {
                // Scale the adherance to the same 0-10 scale as pain values.
                let scaledisosorbideDinitrate = isosorbideDinitratePercentage * 10.0
                
                isosorbideDinitrateValues.append(scaledisosorbideDinitrate)
                isosorbideDinitrateLabels.append(String(describing: isosorbideDinitrateEventsForDay.filter({$0.state == .completed}).count))
            }
            else {
                isosorbideDinitrateValues.append(0.0)
                isosorbideDinitrateLabels.append(NSLocalizedString("0", comment: ""))
            }
            
            axisTitles.append(dayOfWeekFormatter.string(from: dayDate))
            axisSubtitles.append(shortDateFormatter.string(from: dayDate))
        }

        // Create a `OCKBarSeries` for each set of data.
        let painBarSeries = OCKBarSeries(title: "Pain", values: painValues as [NSNumber], valueLabels: painLabels, tintColor: Colors.blue.color)
        let isosorbideDinitrateBarSeries = OCKBarSeries(title: "Isosorbide Dinitrate", values: isosorbideDinitrateValues as [NSNumber], valueLabels: isosorbideDinitrateLabels, tintColor: Colors.lightBlue.color)

        /*
            Add the series to a chart, specifing the scale to use for the chart
            rather than having CareKit scale the bars to fit.
        */
        let chart = OCKBarChart(title: "Chest Pain",
                                text: nil,
                                tintColor: Colors.blue.color,
                                axisTitles: axisTitles,
                                axisSubtitles: axisSubtitles,
                                dataSeries: [painBarSeries, isosorbideDinitrateBarSeries],
                                minimumScaleRangeValue: 0,
                                maximumScaleRangeValue: 10)
        
        return chart
    }
    
    func createSleepDepressionInsight() -> OCKInsightItem? {
        guard let sleepingEvents = sleepingEvents, let depressionEvents = depressionEvents else {return nil}
        
        let calendar = Calendar.current
        var components = DateComponents()
        components.day = -7
        
        let startDate = calendar.date(byAdding: components as DateComponents, to: Date())!
        
        let dayOfWeekFormatter = DateFormatter()
        dayOfWeekFormatter.dateFormat = "E"
        
        let shortDateFormatter = DateFormatter()
        shortDateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "Md", options: 0, locale: shortDateFormatter.locale)
        
        let percentageFormatter = NumberFormatter()
        percentageFormatter.numberStyle = .percent
        
        var sleepingValues = [Float]()
        var sleepingLabels = [String]()
        var depressionValues = [Int]()
        var depressionLabels = [String]()
        var axisTitles = [String]()
        var axisSubtitles = [String]()
        
        for offset in 0..<7 {
            components.day = offset
            let dayDate = calendar.date(byAdding: components as DateComponents, to: startDate)!
            let dayComponents = calendar.dateComponents([.year, .month, .day, .era], from: dayDate)
            
            if let result = depressionEvents[dayComponents].first?.result, let score = Int(result.valueString), score > 0 {
                depressionValues.append(score)
                depressionLabels.append(result.valueString)
            }
            else {
                depressionValues.append(0)
                depressionLabels.append(NSLocalizedString("N/A", comment: ""))
            }
            
            if let result = sleepingEvents[dayComponents].first?.result, let score = Float(result.valueString), score > 0 {
                sleepingValues.append(score)
                sleepingLabels.append(result.valueString)
            }
            else {
                sleepingValues.append(0)
                sleepingLabels.append(NSLocalizedString("N/A", comment: ""))
            }
            
            axisTitles.append(dayOfWeekFormatter.string(from: dayDate))
            axisSubtitles.append(shortDateFormatter.string(from: dayDate))
        }
        
        let depressionBarSeries = OCKBarSeries(title: "Depression", values: depressionValues as [NSNumber], valueLabels: depressionLabels, tintColor: Colors.red.color)
        let sleepingBarSeries = OCKBarSeries(title: "Quality of Sleep", values: sleepingValues as [NSNumber], valueLabels: sleepingLabels, tintColor: Colors.pink.color)
        
        let chart = OCKBarChart(title: "Quality of sleep vs. Mood",
                                text: nil,
                                tintColor: Colors.green.color,
                                axisTitles: axisTitles,
                                axisSubtitles: axisSubtitles,
                                dataSeries: [depressionBarSeries, sleepingBarSeries],
                                minimumScaleRangeValue: 0,
                                maximumScaleRangeValue: 10)
        
        return chart

        }
    
    /**
        For a given array of `OCKCarePlanEvent`s, returns the percentage that are
        marked as completed.
    */
    fileprivate func percentageEventsCompleted(_ events: [OCKCarePlanEvent]) -> Float? {
        guard !events.isEmpty else { return nil }
        
        let completedCount = events.filter({ event in
            event.state == .completed
        }).count
     
        return Float(completedCount) / Float(events.count)
    }
}

/**
 An extension to `SequenceType` whose elements are `OCKCarePlanEvent`s. The
 extension adds a method to return the first element that matches the day
 specified by the supplied `NSDateComponents`.
 */
extension Sequence where Iterator.Element: OCKCarePlanEvent {
    
    func eventForDay(_ dayComponents: NSDateComponents) -> Iterator.Element? {
        for event in self where
                event.date.year == dayComponents.year &&
                event.date.month == dayComponents.month &&
                event.date.day == dayComponents.day {
            return event
        }
        
        return nil
    }
}
