//
//  PHQ9.swift
//  Onboarding
//
//  Created by Stella Cho on 1/18/18.
//  Copyright © 2018 Stella Cho. All rights reserved.
//

import Foundation
import ResearchKit

/*********************************************************************************/
//MARK: - RK Tasks
/*********************************************************************************/

public var PHQ9Task: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    let instStep = ORKInstructionStep(identifier: "Instruction Step")
    instStep.title = "PHQ9 Depression Questions"
    instStep.detailText = "Over the past 2 weeks, how often have you been bothered by any of the following problems?"
    steps += [instStep]
    
    let answerFormat1 = ORKNumericAnswerFormat.scale(withMaximumValue: 3, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Nearly everyday", minimumValueDescription: "Not at all")
    let question1Step = ORKQuestionStep(identifier: "question 1", title: "Little interest or pleasure in doing things", answer: answerFormat1)
    
    let answerFormat2 = ORKNumericAnswerFormat.scale(withMaximumValue: 3, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Nearly everyday", minimumValueDescription: "Not at all")
    let question2Step = ORKQuestionStep(identifier: "question 2", title: "Feeling down, depressed or hopeless", answer: answerFormat2)
    
    let answerFormat3 = ORKNumericAnswerFormat.scale(withMaximumValue: 3, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Nearly everyday", minimumValueDescription: "Not at all")
    let question3Step = ORKQuestionStep(identifier: "question 3", title: "Trouble falling asleep, staying asleep, or sleeping too much", answer: answerFormat3)
    
    let answerFormat4 = ORKNumericAnswerFormat.scale(withMaximumValue: 3, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Nearly everyday", minimumValueDescription: "Not at all")
    let question4Step = ORKQuestionStep(identifier: "question 4", title: "Feeling tired or having little energy", answer: answerFormat4)
    
    let answerFormat5 = ORKNumericAnswerFormat.scale(withMaximumValue: 3, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Nearly everyday", minimumValueDescription: "Not at all")
    let question5Step = ORKQuestionStep(identifier: "question 5", title: "Poor appetite or overeating", answer: answerFormat5)
    
    let answerFormat6 = ORKNumericAnswerFormat.scale(withMaximumValue: 3, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Nearly everyday", minimumValueDescription: "Not at all")
    let question6Step = ORKQuestionStep(identifier: "question 6", title: "Feeling bad about yourself - or that you're a failure or have let yourself or your family down", answer: answerFormat6)
    
    let answerFormat7 = ORKNumericAnswerFormat.scale(withMaximumValue: 3, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Nearly everyday", minimumValueDescription: "Not at all")
    let question7Step = ORKQuestionStep(identifier: "question 7", title: "Trouble concentrating on things, such as reading the newspaper or watching television", answer: answerFormat7)
    
    let answerFormat8 = ORKNumericAnswerFormat.scale(withMaximumValue: 3, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Nearly everyday", minimumValueDescription: "Not at all")
    let question8Step = ORKQuestionStep(identifier: "question 8", title: "Moving or speaking so slowly that other people could have noticed. Or, the opposite - being so fidgety or restless that you have been moving around a lot more than usual", answer: answerFormat8)
    
    let answerFormat9 = ORKNumericAnswerFormat.scale(withMaximumValue: 3, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Nearly everyday", minimumValueDescription: "Not at all")
    let question9Step = ORKQuestionStep(identifier: "question 9", title: "Thoughts thaty you would be better off dead or of hurting yourself in some way", answer: answerFormat9)
    
    steps += [question1Step, question2Step, question3Step, question4Step, question5Step, question6Step, question7Step, question8Step, question9Step]
    
    let completionStep = ORKCompletionStep(identifier: "Completion Step")
    completionStep.title = "Thank you for taking this survey!"
    steps += [completionStep]
    
    
    return ORKOrderedTask(identifier: "SurveyTask", steps: steps)
}



/*********************************************************************************/
//MARK: - RK Results
/*********************************************************************************/
extension ResearchkitVC
{
    func processPHQ9Results(_ taskResult: ORKTaskResult?)
    {
        if let taskResultValue = taskResult
        {
            print("Task Run UUID : " + taskResultValue.taskRunUUID.uuidString)
            print("Survey started at : \(taskResultValue.startDate)     Ended at : \(taskResultValue.endDate)")
            
            if let instStepResult = taskResultValue.stepResult(forStepIdentifier: "Instruction Step")
            {
                print("Instruction Step started at : \(instStepResult.startDate)   Ended at : \(instStepResult.endDate)")
            }
            
            if let question1Result = taskResultValue.stepResult(forStepIdentifier: "question 1")?.results?.first as? ORKScaleQuestionResult
            {
                if question1Result.scaleAnswer != nil
                {
                    print("Answer to question 1 is \(question1Result.scaleAnswer!)")
                }
                else
                {
                    print("question 1 was skipped")
                }
            }
            
            if let question2Result = taskResultValue.stepResult(forStepIdentifier: "question 2")?.results?.first as? ORKScaleQuestionResult
            {
                if question2Result.scaleAnswer != nil
                {
                    print("Answer to question 2 is \(question2Result.scaleAnswer!)")
                }
                else
                {
                    print("question 2 was skipped")
                }
            }
            
            if let question3Result = taskResultValue.stepResult(forStepIdentifier: "question 3")?.results?.first as? ORKScaleQuestionResult
            {
                if question3Result.scaleAnswer != nil
                {
                    print("Answer to question 3 is \(question3Result.scaleAnswer!)")
                }
                else
                {
                    print("question 3 was skipped")
                }
            }
            
            if let question4Result = taskResultValue.stepResult(forStepIdentifier: "question 4")?.results?.first as? ORKScaleQuestionResult
            {
                if question4Result.scaleAnswer != nil
                {
                    print("Answer to question 4 is \(question4Result.scaleAnswer!)")
                }
                else
                {
                    print("question 4 was skipped")
                }
            }
            
            if let question5Result = taskResultValue.stepResult(forStepIdentifier: "question 5")?.results?.first as? ORKScaleQuestionResult
            {
                if question5Result.scaleAnswer != nil
                {
                    print("Answer to question 5 is \(question5Result.scaleAnswer!)")
                }
                else
                {
                    print("question 5 was skipped")
                }
            }
            
            if let question6Result = taskResultValue.stepResult(forStepIdentifier: "question 6")?.results?.first as? ORKScaleQuestionResult
            {
                if question6Result.scaleAnswer != nil
                {
                    print("Answer to question 6 is \(question6Result.scaleAnswer!)")
                }
                else
                {
                    print("question 6 was skipped")
                }
            }
            
            if let question3Result = taskResultValue.stepResult(forStepIdentifier: "question 7")?.results?.first as? ORKScaleQuestionResult
            {
                if question3Result.scaleAnswer != nil
                {
                    print("Answer to question 7 is \(question3Result.scaleAnswer!)")
                }
                else
                {
                    print("question 7 was skipped")
                }
            }
            
            if let question8Result = taskResultValue.stepResult(forStepIdentifier: "question 8")?.results?.first as? ORKScaleQuestionResult
            {
                if question8Result.scaleAnswer != nil
                {
                    print("Answer to question 8 is \(question8Result.scaleAnswer!)")
                }
                else
                {
                    print("question 8 was skipped")
                }
            }
            
            if let question9Result = taskResultValue.stepResult(forStepIdentifier: "question 9")?.results?.first as? ORKScaleQuestionResult
            {
                if question9Result.scaleAnswer != nil
                {
                    print("Answer to question 9 is \(question9Result.scaleAnswer!)")
                }
                else
                {
                    print("question 9 was skipped")
                }
            }
            
            if let compStepResult = taskResultValue.stepResult(forStepIdentifier: "Completion Step")
            {
                print("Completion Step started at : \(compStepResult.startDate)   Ended at : \(compStepResult.endDate)")
            }
        }
    }
    
}


