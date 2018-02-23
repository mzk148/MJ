//
//  Surveys.swift
//  OCKSample
//
//  Created by Stella Cho on 7/28/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import ResearchKit

/*********************************************************************************/
//MARK: - RK Tasks
/*********************************************************************************/
extension OCKSurveysViewController
{
    func showSurvey()
    {
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
        
        let taskViewController = ORKTaskViewController(task: task, taskRun: nil)
        taskViewController.delegate = self as ORKTaskViewControllerDelegate
        present(taskViewController, animated: true, completion: nil)
    }
}


/*********************************************************************************/
//MARK: - RK Results
/*********************************************************************************/
extension OCKSurveysViewController
{
    func processSurveyResults(_ taskResult: ORKTaskResult?)
    {
        if let taskResultValue = taskResult
        {
            print("Task Run UUID : " + taskResultValue.taskRunUUID.uuidString)
            print("Survey started at : \(taskResultValue.startDate)     Ended at : \(taskResultValue.endDate)")
            
            if let instStepResult = taskResultValue.stepResult(forStepIdentifier: "Instruction Step")
            {
                print("Instruction Step started at : \(instStepResult.startDate)   Ended at : \(instStepResult.endDate)")
            }
            
            if let question1Result = taskResultValue.stepResult(forStepIdentifier: "question 1")?.results?.first as? ORKBooleanQuestionResult
            {
                if question1Result.booleanAnswer != nil
                {
                    let answerString = question1Result.booleanAnswer!.boolValue ? "Yes" : "No"
                    print("Answer to question 1 is \(answerString)")
                }
                else
                {
                    print("question 1 was skipped")
                }
            }
            
            if let question2Result = taskResultValue.stepResult(forStepIdentifier: "question 2")?.results?.first as? ORKNumericQuestionResult
            {
                if question2Result.numericAnswer != nil
                {
                    print("Answer to question 2 is \(question2Result.numericAnswer!)")
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
            
            if let question5Result = taskResultValue.stepResult(forStepIdentifier: "question 5")?.results?.first as? ORKDateQuestionResult
            {
                if question5Result.dateAnswer != nil
                {
                    print("Answer to question 5 is \(question5Result.dateAnswer!)")
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
            
            if let compStepResult = taskResultValue.stepResult(forStepIdentifier: "Completion Step")
            {
                print("Completion Step started at : \(compStepResult.startDate)   Ended at : \(compStepResult.endDate)")
            }
        }
    }
    
}
