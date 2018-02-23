//
//  NurseVisitMinnesotaSurvey.swift
//  OCKSample
//
//  Created by Stella Cho on 2/1/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation
import ResearchKit

/*********************************************************************************/
//MARK: - RK Tasks
/*********************************************************************************/

public var NurseVisitMinnesotaSurveyTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    let instStep = ORKInstructionStep(identifier: "Instruction Step")
    instStep.title = "Minnesota Living with Heart Failure Questionnaire"
    instStep.detailText = "Did your heart failure prevent you from living as you wanted during the past month (4 weeks) by"
    steps += [instStep]
    
    let answerFormat1 = ORKNumericAnswerFormat.scale(withMaximumValue: 5, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Very much", minimumValueDescription: "Not at all")
    let question1Step = ORKQuestionStep(identifier: "question 1", title: "causing swelling in your ankles or legs?", answer: answerFormat1)
    
    let answerFormat2 = ORKNumericAnswerFormat.scale(withMaximumValue: 5, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Very much", minimumValueDescription: "Not at all")
    let question2Step = ORKQuestionStep(identifier: "question 2", title: "making you sit or lie down to rest during the day?", answer: answerFormat2)
    
    let answerFormat3 = ORKNumericAnswerFormat.scale(withMaximumValue: 5, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Very much", minimumValueDescription: "Not at all")
    let question3Step = ORKQuestionStep(identifier: "question 3", title: "making your walking about or climbing stairs difficult?", answer: answerFormat3)
    
    let answerFormat4 = ORKNumericAnswerFormat.scale(withMaximumValue: 5, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Very much", minimumValueDescription: "Not at all")
    let question4Step = ORKQuestionStep(identifier: "question 4", title: "making your working around the house or yard difficult?", answer: answerFormat4)
    
    let answerFormat5 = ORKNumericAnswerFormat.scale(withMaximumValue: 5, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Very much", minimumValueDescription: "Not at all")
    let question5Step = ORKQuestionStep(identifier: "question 5", title: "making your going places away from home difficult?", answer: answerFormat5)
    
    let answerFormat6 = ORKNumericAnswerFormat.scale(withMaximumValue: 5, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Very much", minimumValueDescription: "Not at all")
    let question6Step = ORKQuestionStep(identifier: "question 6", title: "making your sleeping well at night difficult?", answer: answerFormat6)
    
    let answerFormat7 = ORKNumericAnswerFormat.scale(withMaximumValue: 5, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Very much", minimumValueDescription: "Not at all")
    let question7Step = ORKQuestionStep(identifier: "question 7", title: "making your relating to or doing things with your friends or family difficult?", answer: answerFormat7)
    
    let answerFormat8 = ORKNumericAnswerFormat.scale(withMaximumValue: 5, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Very much", minimumValueDescription: "Not at all")
    let question8Step = ORKQuestionStep(identifier: "question 8", title: "making your working to earn a living difficult?", answer: answerFormat8)
    
    let answerFormat9 = ORKNumericAnswerFormat.scale(withMaximumValue: 5, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Very much", minimumValueDescription: "Not at all")
    let question9Step = ORKQuestionStep(identifier: "question 9", title: "making your recreational pastimes, sports or hobbies difficult?", answer: answerFormat9)
    
    let answerFormat10 = ORKNumericAnswerFormat.scale(withMaximumValue: 5, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Very much", minimumValueDescription: "Not at all")
    let question10Step = ORKQuestionStep(identifier: "question 10", title: "making your sexual activities difficult?", answer: answerFormat10)
    
    let answerFormat11 = ORKNumericAnswerFormat.scale(withMaximumValue: 5, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Very much", minimumValueDescription: "Not at all")
    let question11Step = ORKQuestionStep(identifier: "question 11", title: "making you eat less of the foods you like?", answer: answerFormat11)
    
    let answerFormat12 = ORKNumericAnswerFormat.scale(withMaximumValue: 5, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Very much", minimumValueDescription: "Not at all")
    let question12Step = ORKQuestionStep(identifier: "question 12", title: "making you short of breath?", answer: answerFormat12)
    
    let answerFormat13 = ORKNumericAnswerFormat.scale(withMaximumValue: 5, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Very much", minimumValueDescription: "Not at all")
    let question13Step = ORKQuestionStep(identifier: "question 13", title: "making you tired, fatigued, or low on energy?", answer: answerFormat13)
    
    let answerFormat14 = ORKNumericAnswerFormat.scale(withMaximumValue: 5, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Very much", minimumValueDescription: "Not at all")
    let question14Step = ORKQuestionStep(identifier: "question 14", title: "making you stay in a hospital?", answer: answerFormat14)
    
    let answerFormat15 = ORKNumericAnswerFormat.scale(withMaximumValue: 5, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Very much", minimumValueDescription: "Not at all")
    let question15Step = ORKQuestionStep(identifier: "question 15", title: "costing you money for medical care?", answer: answerFormat15)
    
    let answerFormat16 = ORKNumericAnswerFormat.scale(withMaximumValue: 5, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Very much", minimumValueDescription: "Not at all")
    let question16Step = ORKQuestionStep(identifier: "question 16", title: "giving you side effects from treatments?", answer: answerFormat16)
    
    let answerFormat17 = ORKNumericAnswerFormat.scale(withMaximumValue: 5, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Very much", minimumValueDescription: "Not at all")
    let question17Step = ORKQuestionStep(identifier: "question 17", title: "making you feel you are a burden to your family or friends?", answer: answerFormat17)
    
    let answerFormat18 = ORKNumericAnswerFormat.scale(withMaximumValue: 5, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Very much", minimumValueDescription: "Not at all")
    let question18Step = ORKQuestionStep(identifier: "question 18", title: "making you feel a loss of self-control in your life?", answer: answerFormat18)
    
    let answerFormat19 = ORKNumericAnswerFormat.scale(withMaximumValue: 5, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Very much", minimumValueDescription: "Not at all")
    let question19Step = ORKQuestionStep(identifier: "question 19", title: "making you worry?", answer: answerFormat19)
    
    let answerFormat20 = ORKNumericAnswerFormat.scale(withMaximumValue: 5, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Very much", minimumValueDescription: "Not at all")
    let question20Step = ORKQuestionStep(identifier: "question 20", title: "making it difficult for you to concentrate or remember things?", answer: answerFormat20)
    
    let answerFormat21 = ORKNumericAnswerFormat.scale(withMaximumValue: 5, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Very much", minimumValueDescription: "Not at all")
    let question21Step = ORKQuestionStep(identifier: "question 21", title: "making you feel depressed?", answer: answerFormat21)
    
    steps += [question1Step, question2Step, question3Step, question4Step, question5Step, question6Step, question7Step, question8Step, question9Step, question10Step, question11Step, question12Step, question13Step, question14Step, question15Step, question16Step, question17Step, question18Step, question19Step, question20Step, question21Step]
    
    let completionStep = ORKCompletionStep(identifier: "Completion Step")
    completionStep.title = "Thank you for taking this survey!"
    steps += [completionStep]
    
    
    return ORKOrderedTask(identifier: "SurveyTask", steps: steps)
}



/*********************************************************************************/
//MARK: - RK Results
/*********************************************************************************/
extension NurseVisitVC
{
    func processNurseVisitMinnesotaSurveyResults(_ taskResult: ORKTaskResult?)
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
            
            if let question10Result = taskResultValue.stepResult(forStepIdentifier: "question 10")?.results?.first as? ORKScaleQuestionResult
            {
                if question10Result.scaleAnswer != nil
                {
                    print("Answer to question 10 is \(question10Result.scaleAnswer!)")
                }
                else
                {
                    print("question 10 was skipped")
                }
            }
            
            if let question11Result = taskResultValue.stepResult(forStepIdentifier: "question 11")?.results?.first as? ORKScaleQuestionResult
            {
                if question11Result.scaleAnswer != nil
                {
                    print("Answer to question 11 is \(question11Result.scaleAnswer!)")
                }
                else
                {
                    print("question 11 was skipped")
                }
            }
            
            if let question12Result = taskResultValue.stepResult(forStepIdentifier: "question 12")?.results?.first as? ORKScaleQuestionResult
            {
                if question12Result.scaleAnswer != nil
                {
                    print("Answer to question 12 is \(question12Result.scaleAnswer!)")
                }
                else
                {
                    print("question 12 was skipped")
                }
            }
            
            if let question13Result = taskResultValue.stepResult(forStepIdentifier: "question 13")?.results?.first as? ORKScaleQuestionResult
            {
                if question13Result.scaleAnswer != nil
                {
                    print("Answer to question 13 is \(question13Result.scaleAnswer!)")
                }
                else
                {
                    print("question 13 was skipped")
                }
            }
            
            if let question14Result = taskResultValue.stepResult(forStepIdentifier: "question 14")?.results?.first as? ORKScaleQuestionResult
            {
                if question14Result.scaleAnswer != nil
                {
                    print("Answer to question 14 is \(question14Result.scaleAnswer!)")
                }
                else
                {
                    print("question 14 was skipped")
                }
            }
            
            if let question15Result = taskResultValue.stepResult(forStepIdentifier: "question 15")?.results?.first as? ORKScaleQuestionResult
            {
                if question15Result.scaleAnswer != nil
                {
                    print("Answer to question 15 is \(question15Result.scaleAnswer!)")
                }
                else
                {
                    print("question 15 was skipped")
                }
            }
            
            if let question16Result = taskResultValue.stepResult(forStepIdentifier: "question 16")?.results?.first as? ORKScaleQuestionResult
            {
                if question16Result.scaleAnswer != nil
                {
                    print("Answer to question 16 is \(question16Result.scaleAnswer!)")
                }
                else
                {
                    print("question 16 was skipped")
                }
            }
            
            if let question17Result = taskResultValue.stepResult(forStepIdentifier: "question 17")?.results?.first as? ORKScaleQuestionResult
            {
                if question17Result.scaleAnswer != nil
                {
                    print("Answer to question 17 is \(question17Result.scaleAnswer!)")
                }
                else
                {
                    print("question 17 was skipped")
                }
            }
            
            if let question18Result = taskResultValue.stepResult(forStepIdentifier: "question 18")?.results?.first as? ORKScaleQuestionResult
            {
                if question18Result.scaleAnswer != nil
                {
                    print("Answer to question 18 is \(question18Result.scaleAnswer!)")
                }
                else
                {
                    print("question 18 was skipped")
                }
            }
            
            if let question19Result = taskResultValue.stepResult(forStepIdentifier: "question 19")?.results?.first as? ORKScaleQuestionResult
            {
                if question19Result.scaleAnswer != nil
                {
                    print("Answer to question 19 is \(question19Result.scaleAnswer!)")
                }
                else
                {
                    print("question 19 was skipped")
                }
            }
            
            if let question20Result = taskResultValue.stepResult(forStepIdentifier: "question 20")?.results?.first as? ORKScaleQuestionResult
            {
                if question20Result.scaleAnswer != nil
                {
                    print("Answer to question 20 is \(question20Result.scaleAnswer!)")
                }
                else
                {
                    print("question 20 was skipped")
                }
            }
            
            if let question21Result = taskResultValue.stepResult(forStepIdentifier: "question 21")?.results?.first as? ORKScaleQuestionResult
            {
                if question21Result.scaleAnswer != nil
                {
                    print("Answer to question 21 is \(question21Result.scaleAnswer!)")
                }
                else
                {
                    print("question 21 was skipped")
                }
            }
            
            if let compStepResult = taskResultValue.stepResult(forStepIdentifier: "Completion Step")
            {
                print("Completion Step started at : \(compStepResult.startDate)   Ended at : \(compStepResult.endDate)")
            }
        }
    }
    
}


