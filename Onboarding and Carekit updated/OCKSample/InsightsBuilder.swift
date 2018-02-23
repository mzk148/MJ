/*
 Copyright (c) 2016, Apple Inc. All rights reserved.
 
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

class InsightsBuilder {
    
    /// An array if `OCKInsightItem` to show on the Insights view.
    fileprivate(set) var insights = [OCKInsightItem.emptyInsightsMessage()]
    
    fileprivate let carePlanStore: OCKCarePlanStore
    
    fileprivate let updateOperationQueue = OperationQueue()
    
    required init(carePlanStore: OCKCarePlanStore) {
        self.carePlanStore = carePlanStore
    }

    /**
        Enqueues `NSOperation`s to query the `OCKCarePlanStore` and update the
        `insights` property.
    */
    func updateInsights(_ completion: ((Bool, [OCKInsightItem]?) -> Void)?) {
        // Cancel any in-progress operations. 
        updateOperationQueue.cancelAllOperations()

        // Get the dates the current and previous weeks.
        let queryDateRange = calculateQueryDateRange()
        
        /*
            Create an operation to query for events for the previous week's
            `TakeMedication` activity.
         */
        
        let morningMedicationEventsOperation = QueryActivityEventsOperation(store: carePlanStore,
                                                                     activityIdentifier: ActivityType.morningMedication.rawValue,
                                                                     startDate: queryDateRange.start,
                                                                     endDate: queryDateRange.end)
        
        let afternoonMedicationEventsOperation = QueryActivityEventsOperation(store: carePlanStore,
                                                                            activityIdentifier: ActivityType.afternoonMedication.rawValue,
                                                                            startDate: queryDateRange.start,
                                                                            endDate: queryDateRange.end)
        
        let tonightMedicationEventsOperation = QueryActivityEventsOperation(store: carePlanStore,
                                                                              activityIdentifier: ActivityType.tonightMedication.rawValue,
                                                                              startDate: queryDateRange.start,
                                                                              endDate: queryDateRange.end)
        
        let isosorbideDinitrateEventsOperation = QueryActivityEventsOperation(store: carePlanStore,
                                                                     activityIdentifier: ActivityType.isosorbideDinitrate.rawValue,
                                                                     startDate: queryDateRange.start,
                                                                     endDate: queryDateRange.end)
        
        let betaBlockerEventsOperation = QueryActivityEventsOperation(store: carePlanStore,
                                                                              activityIdentifier: ActivityType.betaBlocker.rawValue,
                                                                              startDate: queryDateRange.start,
                                                                              endDate: queryDateRange.end)
        
        let tylenolEventsOperation = QueryActivityEventsOperation(store: carePlanStore,
                                                                      activityIdentifier: ActivityType.tylenol.rawValue,
                                                                      startDate: queryDateRange.start,
                                                                      endDate: queryDateRange.end)
        
        let sodiumEventsOperation = QueryActivityEventsOperation(store: carePlanStore,
                                                                   activityIdentifier: ActivityType.sodium.rawValue,
                                                                   startDate: queryDateRange.start,
                                                                   endDate: queryDateRange.end)
        
        let waterEventsOperation = QueryActivityEventsOperation(store: carePlanStore,
                                                                 activityIdentifier: ActivityType.water.rawValue,
                                                                 startDate: queryDateRange.start,
                                                                 endDate: queryDateRange.end)
        
        let physicalActivityEventsOperation = QueryActivityEventsOperation(store: carePlanStore,
                                                              activityIdentifier: ActivityType.physicalActivity.rawValue,
                                                              startDate: queryDateRange.start,
                                                              endDate: queryDateRange.end)
        
        let mobileDeviceEventsOperation = QueryActivityEventsOperation(store: carePlanStore,
                                                                           activityIdentifier: ActivityType.mobileDevice.rawValue,
                                                                           startDate: queryDateRange.start,
                                                                           endDate: queryDateRange.end)
        
        let fitnessEventsOperation = QueryActivityEventsOperation(store: carePlanStore,
                                                                           activityIdentifier: ActivityType.fitness.rawValue,
                                                                           startDate: queryDateRange.start,
                                                                           endDate: queryDateRange.end)
        
        let minnesotaEventsOperation = QueryActivityEventsOperation(store: carePlanStore,
                                                                    activityIdentifier: ActivityType.minnesota.rawValue,
                                                                    startDate: queryDateRange.start,
                                                                    endDate: queryDateRange.end)
        
        /*
         Create an operation to query for events for the previous week's
         `Weight` activity.
         */
        
        let weightEventsOperation = QueryActivityEventsOperation(store: carePlanStore,
                                                                 activityIdentifier: ActivityType.weight.rawValue,
                                                                 startDate: queryDateRange.start,
                                                                 endDate: queryDateRange.end)
        
        let stepsEventsOperation = QueryActivityEventsOperation(store: carePlanStore,
                                                                 activityIdentifier: ActivityType.steps.rawValue,
                                                                 startDate: queryDateRange.start,
                                                                 endDate: queryDateRange.end)
        
        /*  Create an operation to query for events for the previous week and
            current weeks' `BackPain` assessment.
         */
        
        let chestPainEventsOperation = QueryActivityEventsOperation(store: carePlanStore,
                                                                   activityIdentifier: ActivityType.chestPain.rawValue,
                                                                   startDate: queryDateRange.start,
                                                                   endDate: queryDateRange.end)
        
        let heartRateEventsOperation = QueryActivityEventsOperation(store: carePlanStore,
                                                                    activityIdentifier: ActivityType.heartRate.rawValue,
                                                                    startDate: queryDateRange.start,
                                                                    endDate: queryDateRange.end)
        
        let shortnessOfBreathEventsOperation = QueryActivityEventsOperation(store: carePlanStore,
                                                                   activityIdentifier: ActivityType.shortnessOfBreath.rawValue,
                                                                   startDate: queryDateRange.start,
                                                                   endDate: queryDateRange.end)
        
        let edemaEventsOperation = QueryActivityEventsOperation(store: carePlanStore,
                                                                            activityIdentifier: ActivityType.edema.rawValue,
                                                                            startDate: queryDateRange.start,
                                                                            endDate: queryDateRange.end)
        
        let fatigueEventsOperation = QueryActivityEventsOperation(store: carePlanStore,
                                                                activityIdentifier: ActivityType.fatigue.rawValue,
                                                                startDate: queryDateRange.start,
                                                                endDate: queryDateRange.end)
        
        let sleepingEventsOperation = QueryActivityEventsOperation(store: carePlanStore,
                                                                  activityIdentifier: ActivityType.sleeping.rawValue,
                                                                  startDate: queryDateRange.start,
                                                                  endDate: queryDateRange.end)
        
        let sleepHoursEventsOperation = QueryActivityEventsOperation(store: carePlanStore,
                                                                   activityIdentifier: ActivityType.sleepHours.rawValue,
                                                                   startDate: queryDateRange.start,
                                                                   endDate: queryDateRange.end)
        
        let concentrationEventsOperation = QueryActivityEventsOperation(store: carePlanStore,
                                                                     activityIdentifier: ActivityType.concentration.rawValue,
                                                                     startDate: queryDateRange.start,
                                                                     endDate: queryDateRange.end)
        
        let happinessEventsOperation = QueryActivityEventsOperation(store: carePlanStore,
                                                                        activityIdentifier: ActivityType.happiness.rawValue,
                                                                        startDate: queryDateRange.start,
                                                                        endDate: queryDateRange.end)
        
        let depressionEventsOperation = QueryActivityEventsOperation(store: carePlanStore,
                                                                    activityIdentifier: ActivityType.depression.rawValue,
                                                                    startDate: queryDateRange.start,
                                                                    endDate: queryDateRange.end)
        
        let SBPEventsOperation = QueryActivityEventsOperation(store: carePlanStore,
                                                                    activityIdentifier: ActivityType.SBP.rawValue,
                                                                    startDate: queryDateRange.start,
                                                                    endDate: queryDateRange.end)
        
        
        /*
            Create a `BuildInsightsOperation` to create insights from the data
            collected by query operations.
        */
        let buildInsightsOperation = BuildInsightsOperation()
        
        /*
            Create an operation to aggregate the data from query operations into
            the `BuildInsightsOperation`.
        */
        let aggregateDataOperation = BlockOperation {
            // Copy the queried data from the query operations to the `BuildInsightsOperation`.
            buildInsightsOperation.afternoonMedicationEvents = afternoonMedicationEventsOperation.dailyEvents
            buildInsightsOperation.morningMedicationEvents = morningMedicationEventsOperation.dailyEvents
            buildInsightsOperation.tonightMedicationEvents = tonightMedicationEventsOperation.dailyEvents
            buildInsightsOperation.isosorbideDinitrateEvents = isosorbideDinitrateEventsOperation.dailyEvents
            buildInsightsOperation.betaBlockerEvents = betaBlockerEventsOperation.dailyEvents
            buildInsightsOperation.tylenolEvents = tylenolEventsOperation.dailyEvents
            buildInsightsOperation.sodiumEvents = sodiumEventsOperation.dailyEvents
            buildInsightsOperation.waterEvents = waterEventsOperation.dailyEvents
            buildInsightsOperation.physicalActivityEvents = physicalActivityEventsOperation.dailyEvents
            buildInsightsOperation.mobileDeviceEvents = mobileDeviceEventsOperation.dailyEvents
            buildInsightsOperation.fitnessEvents = fitnessEventsOperation.dailyEvents
            buildInsightsOperation.minnesotaEvents = minnesotaEventsOperation.dailyEvents
            buildInsightsOperation.weightEvents = weightEventsOperation.dailyEvents
            buildInsightsOperation.chestPainEvents = chestPainEventsOperation.dailyEvents
            buildInsightsOperation.heartRateEvents = heartRateEventsOperation.dailyEvents
            buildInsightsOperation.shortnessOfBreathEvents = shortnessOfBreathEventsOperation.dailyEvents
            buildInsightsOperation.edemaEvents = edemaEventsOperation.dailyEvents
            buildInsightsOperation.fatigueEvents = fatigueEventsOperation.dailyEvents
            buildInsightsOperation.sleepingEvents = sleepingEventsOperation.dailyEvents
            buildInsightsOperation.sleepHoursEvents = sleepHoursEventsOperation.dailyEvents
            buildInsightsOperation.concentrationEvents = concentrationEventsOperation.dailyEvents
            buildInsightsOperation.happinessEvents = happinessEventsOperation.dailyEvents
            buildInsightsOperation.depressionEvents = depressionEventsOperation.dailyEvents
            buildInsightsOperation.SBPEvents = SBPEventsOperation.dailyEvents
            
            buildInsightsOperation.stepsEvents = stepsEventsOperation.dailyEvents
        }
        
        /*
            Use the completion block of the `BuildInsightsOperation` to store the
            new insights and call the completion block passed to this method.
        */
        buildInsightsOperation.completionBlock = { [unowned buildInsightsOperation] in
            let completed = !buildInsightsOperation.isCancelled
            let newInsights = buildInsightsOperation.insights
            
            // Call the completion block on the main queue.
            OperationQueue.main.addOperation {
                if completed {
                    completion?(true, newInsights)
                }
                else {
                    completion?(false, nil)
                }
            }
        }
        
        // The aggregate operation is dependent on the query operations.
        aggregateDataOperation.addDependency(afternoonMedicationEventsOperation)
        aggregateDataOperation.addDependency(morningMedicationEventsOperation)
        aggregateDataOperation.addDependency(tonightMedicationEventsOperation)
        aggregateDataOperation.addDependency(isosorbideDinitrateEventsOperation)
        aggregateDataOperation.addDependency(betaBlockerEventsOperation)
        aggregateDataOperation.addDependency(tylenolEventsOperation)
        aggregateDataOperation.addDependency(sodiumEventsOperation)
        aggregateDataOperation.addDependency(waterEventsOperation)
        aggregateDataOperation.addDependency(physicalActivityEventsOperation)
        aggregateDataOperation.addDependency(mobileDeviceEventsOperation)
        aggregateDataOperation.addDependency(fitnessEventsOperation)
        aggregateDataOperation.addDependency(minnesotaEventsOperation)
        aggregateDataOperation.addDependency(weightEventsOperation)
        aggregateDataOperation.addDependency(chestPainEventsOperation)
        aggregateDataOperation.addDependency(heartRateEventsOperation)
        aggregateDataOperation.addDependency(shortnessOfBreathEventsOperation)
        aggregateDataOperation.addDependency(edemaEventsOperation)
        aggregateDataOperation.addDependency(fatigueEventsOperation)
        aggregateDataOperation.addDependency(sleepingEventsOperation)
        aggregateDataOperation.addDependency(sleepHoursEventsOperation)
        aggregateDataOperation.addDependency(concentrationEventsOperation)
        aggregateDataOperation.addDependency(happinessEventsOperation)
        aggregateDataOperation.addDependency(depressionEventsOperation)
        aggregateDataOperation.addDependency(SBPEventsOperation)
        
        aggregateDataOperation.addDependency(stepsEventsOperation)
        
        // The `BuildInsightsOperation` is dependent on the aggregate operation.
        buildInsightsOperation.addDependency(aggregateDataOperation)
        
        // Add all the operations to the operation queue.
        updateOperationQueue.addOperations([
            afternoonMedicationEventsOperation,
            morningMedicationEventsOperation,
            tonightMedicationEventsOperation,
            isosorbideDinitrateEventsOperation,
            betaBlockerEventsOperation,
            tylenolEventsOperation,
            sodiumEventsOperation,
            waterEventsOperation,
            physicalActivityEventsOperation,
            mobileDeviceEventsOperation,
            fitnessEventsOperation,
            minnesotaEventsOperation,
            weightEventsOperation,
            chestPainEventsOperation,
            heartRateEventsOperation,
            shortnessOfBreathEventsOperation,
            edemaEventsOperation,
            fatigueEventsOperation,
            sleepingEventsOperation,
            sleepHoursEventsOperation,
            concentrationEventsOperation,
            happinessEventsOperation,
            depressionEventsOperation,
            SBPEventsOperation,
            
            stepsEventsOperation,
            aggregateDataOperation,
            buildInsightsOperation
        ], waitUntilFinished: false)
    }
    
    fileprivate func calculateQueryDateRange() -> (start: DateComponents, end: DateComponents) {
        let calendar = Calendar.current
        let now = Date()
        
        let currentWeekRange = calendar.weekDatesForDate(now)
        let previousWeekRange = calendar.weekDatesForDate(currentWeekRange.start.addingTimeInterval(-1))
        
        let queryRangeStart = calendar.dateComponents([.year, .month, .day, .era], from: previousWeekRange.start)
        let queryRangeEnd = calendar.dateComponents([.year, .month, .day, .era], from: now)
        
        return (start: queryRangeStart, end: queryRangeEnd)
    }
}



protocol InsightsBuilderDelegate: class {
    func insightsBuilder(_ insightsBuilder: InsightsBuilder, didUpdateInsights insights: [OCKInsightItem])
}
