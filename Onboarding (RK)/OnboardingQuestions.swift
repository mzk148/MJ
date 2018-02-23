//
//  OnboardingQuestions.swift
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

public var OnboardingTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    let instStep = ORKInstructionStep(identifier: "Instruction Step")
    instStep.title = "Demographic Questions"
    instStep.detailText = "This survey demonstrates different question types about your background information and current health condition."
    steps += [instStep]
    
    let question1Step = ORKQuestionStep(identifier: "question 1", title: "How old were you on your last birthday?", answer: ORKAnswerFormat.integerAnswerFormat(withUnit: "years old"))
    
    let question2Step = ORKQuestionStep(identifier: "question 2", title: "Do you consider yourself Hispanic or Latino? ", answer: ORKAnswerFormat.booleanAnswerFormat())
    
    let textChoices3 = [
        ORKTextChoice(text: "Male", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Female", value: 1 as NSCoding & NSCopying & NSObjectProtocol)]
    
    let answerFormat3 = ORKTextChoiceAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices3)
    let question3Step = ORKQuestionStep(identifier: "question 3", title: "What is your sex?", answer: answerFormat3)
    
    let textChoices4 = [
        ORKTextChoice(text: "Less than high school", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "High school or GED", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Some college credit, no degree", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Bachelor's degree", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Above Bachelor's degree", value: 4 as NSCoding & NSCopying & NSObjectProtocol)]
    
    let answerFormat4 = ORKTextChoiceAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices4)
    let question4Step = ORKQuestionStep(identifier: "question 4", title: "What is the highest degree or level of school you have completed?", answer: answerFormat4)
    
    
    let textChoices5 = [
        ORKTextChoice(text: "Sedentary", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Mildly active", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Moderately active", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Very active", value: 3 as NSCoding & NSCopying & NSObjectProtocol)]
    
    let answerFormat5 = ORKTextChoiceAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices5)
    let question5Step = ORKQuestionStep(identifier: "question 5", title: "How would you describe your level of daily activity?", answer: answerFormat5)
    
    let textChoices6 = [
        ORKTextChoice(text: "Walking", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Swimming", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Spinning or any other gym cardio equipment", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Personal training", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Cardiac rehab program", value: 4 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Weight lifting", value: 5 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Other", value: 6 as NSCoding & NSCopying & NSObjectProtocol)]
    
    let answerFormat6 = ORKTextChoiceAnswerFormat.choiceAnswerFormat(with: .multipleChoice, textChoices: textChoices6)
    let question6Step = ORKQuestionStep(identifier: "question 6", title: "Are you engaged in any of these exercise programs? You can choose more than one.", answer: answerFormat6)
    
    let textChoices7 = [
        ORKTextChoice(text: "My insurance adequately covers my healthcare needs", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "My insurance adequately covers my HF needs", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "My insurance adequately covers all the medications that I need", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "The cost of managing adherence behaviors with regards to HR is not a problem for me", value: 3 as NSCoding & NSCopying & NSObjectProtocol)]
    
    let answerFormat7 = ORKTextChoiceAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices7)
    let question7Step = ORKQuestionStep(identifier: "question 7", title: "Are you engaged in any of these exercise programs? You can choose more than one.", answer: answerFormat7)
    
    let textChoices8 = [
        ORKTextChoice(text: "<1000mg per day", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "<1500mg per day", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "<2000mg per day", value: 2 as NSCoding & NSCopying & NSObjectProtocol)]
    
    let answerFormat8 = ORKTextChoiceAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices8)
    let question8Step = ORKQuestionStep(identifier: "question 8", title: "Has your health care team suggested you any salt restriction? If yes, please answer this question.", answer: answerFormat8)
    
    let textChoices9 = [
        ORKTextChoice(text: "In my head", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Write on paper", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "On my phone or an app", value: 2 as NSCoding & NSCopying & NSObjectProtocol)]
    
    let answerFormat9 = ORKTextChoiceAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices9)
    let question9Step = ORKQuestionStep(identifier: "question 9", title: "How do you track your salt intake? Please answer this question if you're having salt restriction.", answer: answerFormat9)
    
    let textChoices10 = [
        ORKTextChoice(text: "<1L per day", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "<1.5L per day", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "<2L per day", value: 2 as NSCoding & NSCopying & NSObjectProtocol)]
    
    let answerFormat10 = ORKTextChoiceAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices10)
    let question10Step = ORKQuestionStep(identifier: "question 10", title: "Has your health care team suggested you any fluid restriction? If yes, please answer this question.", answer: answerFormat10)
    
    let textChoices11 = [
        ORKTextChoice(text: "In my head", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Write on paper", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "On my phone or an app", value: 2 as NSCoding & NSCopying & NSObjectProtocol)]
    
    let answerFormat11 = ORKTextChoiceAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices11)
    let question11Step = ORKQuestionStep(identifier: "question 11", title: "How do you track your fluid intake? Please answer this question if you're having fluid restriction.", answer: answerFormat11)
    
    let question12Step = ORKQuestionStep(identifier: "question 12", title: "Do you have a goal 'dry' weight suggested by your health care team?", answer: ORKAnswerFormat.integerAnswerFormat(withUnit: "lbs"))
    
    let question13Step = ORKQuestionStep(identifier: "question 13", title: "Do you have a blood pressure goal suggested by your health care team? (SBP/DBP)", answer: ORKAnswerFormat.textAnswerFormat())
    
    let question14Step = ORKQuestionStep(identifier: "question 14", title: "How many different types of medication do you take every day?", answer: ORKAnswerFormat.integerAnswerFormat(withUnit: "types"))
    
    let answerFormat15 = ORKNumericAnswerFormat.scale(withMaximumValue: 10, minimumValue: 1, defaultValue: 1, step: 1, vertical: false, maximumValueDescription: "Most complicated", minimumValueDescription: "So easy")
    let question15Step = ORKQuestionStep(identifier: "question 15", title: "On a scale of 1 to 10, how complicated to you believe your medication regimen is?", answer: answerFormat15)
    
    let answerFormat16 = ORKNumericAnswerFormat.scale(withMaximumValue: 10, minimumValue: 1, defaultValue: 1, step: 1, vertical: false, maximumValueDescription: "Most well treated", minimumValueDescription: "Not treated at all")
    let question16Step = ORKQuestionStep(identifier: "question 16", title: "On a scale of 1 to 10, how well to you believe your HF provider treated?", answer: answerFormat16)
    
    let question17Step = ORKQuestionStep(identifier: "question 17", title: "How many different doctors do you see at least once a year for ALL of your healthcare needs?", answer: ORKAnswerFormat.integerAnswerFormat(withUnit: "."))
    
    let textChoices18 = [
        ORKTextChoice(text: "Stroke", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "High blood pressure (Hypertension)", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Arthritis or rheumatism", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Heart attack", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "High cholesterol", value: 4 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Blocked arteries in your heart, arteriosclerosis, or angina", value: 5 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Kidney trouble", value: 6 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Depression", value: 7 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Anxiety", value: 8 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Serious back trouble", value: 9 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Asthma or allergy", value: 10 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Cancer", value: 11 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Stomach ulcer or duodenal ulcer", value: 12 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Diabetes", value: 13 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Other", value: 14 as NSCoding & NSCopying & NSObjectProtocol)]
    
    let answerFormat18 = ORKTextChoiceAnswerFormat.choiceAnswerFormat(with: .multipleChoice, textChoices: textChoices18)
    let question18Step = ORKQuestionStep(identifier: "question 18", title: "Do you have or have you ever had any of the following conditions? You can choose more than one.", answer: answerFormat18)
    
    let question19Step = ORKQuestionStep(identifier: "question 19", title: "At what age were you diagnosed with HF?", answer: ORKAnswerFormat.integerAnswerFormat(withUnit: "years old"))
    
    let question20Step = ORKQuestionStep(identifier: "question 20", title: "At what age did you start taking medication?", answer: ORKAnswerFormat.integerAnswerFormat(withUnit: "years old"))
    
    steps += [question1Step, question2Step, question3Step, question4Step, question5Step, question6Step, question7Step, question8Step, question9Step, question10Step, question11Step, question12Step, question13Step, question14Step, question15Step, question16Step, question17Step, question18Step, question19Step, question20Step]
    
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
    func processOnboardingResults(_ taskResult: ORKTaskResult?)
    {
        if let taskResultValue = taskResult
        {
            print("Task Run UUID : " + taskResultValue.taskRunUUID.uuidString)
            print("Survey started at : \(taskResultValue.startDate)     Ended at : \(taskResultValue.endDate)")
            
            if let instStepResult = taskResultValue.stepResult(forStepIdentifier: "Instruction Step")
            {
                print("Instruction Step started at : \(instStepResult.startDate)   Ended at : \(instStepResult.endDate)")
            }
            
            if let question1Result = taskResultValue.stepResult(forStepIdentifier: "question 1")?.results?.first as? ORKNumericQuestionResult
            {
                if question1Result.numericAnswer != nil
                {
                    print("Answer to question 1 is \(question1Result.numericAnswer!)")
                }
                else
                {
                    print("question 1 was skipped")
                }
                
                if let question2Result = taskResultValue.stepResult(forStepIdentifier: "question 2")?.results?.first as? ORKBooleanQuestionResult
                {
                    if question2Result.booleanAnswer != nil
                    {
                        let answerString = question2Result.booleanAnswer!.boolValue ? "Yes, I am Hispanic or Latino." : "No, I'm neither Hispanic nor Latino."
                        print("Answer to question 2 is \(answerString)")
                    }
                    else
                    {
                        print("question 2 was skipped")
                    }
                }
                
                
                
                if let question3Result = taskResultValue.stepResult(forStepIdentifier: "question 3")?.results?.first as? ORKChoiceQuestionResult
                {
                    if question3Result.choiceAnswers != nil
                    {
                        print("Answer to question 3 is \(question3Result.choiceAnswers!)")
                    }
                    else
                    {
                        print("question 3 was skipped")
                    }
                }
                
                if let question4Result = taskResultValue.stepResult(forStepIdentifier: "question 4")?.results?.first as? ORKChoiceQuestionResult
                {
                    if question4Result.choiceAnswers != nil
                    {
                        print("Answer to question 4 is \(question4Result.choiceAnswers!)")
                    }
                    else
                    {
                        print("question 4 was skipped")
                    }
                }
                
                if let question5Result = taskResultValue.stepResult(forStepIdentifier: "question 5")?.results?.first as? ORKChoiceQuestionResult
                {
                    if question5Result.choiceAnswers != nil
                    {
                        print("Answer to question 5 is \(question5Result.choiceAnswers!)")
                    }
                    else
                    {
                        print("question 5 was skipped")
                    }
                }
                
                if let question6Result = taskResultValue.stepResult(forStepIdentifier: "question 6")?.results?.first as? ORKChoiceQuestionResult
                {
                    if question6Result.choiceAnswers != nil
                    {
                        print("Answer to question 6 is \(question6Result.choiceAnswers!)")
                    }
                    else
                    {
                        print("question 6 was skipped")
                    }
                }
                
                if let question7Result = taskResultValue.stepResult(forStepIdentifier: "question 7")?.results?.first as? ORKChoiceQuestionResult
                {
                    if question7Result.choiceAnswers != nil
                    {
                        print("Answer to question 7 is \(question7Result.choiceAnswers!)")
                    }
                    else
                    {
                        print("question 7 was skipped")
                    }
                }
                
                if let question8Result = taskResultValue.stepResult(forStepIdentifier: "question 8")?.results?.first as? ORKChoiceQuestionResult
                {
                    if question8Result.choiceAnswers != nil
                    {
                        print("Answer to question 8 is \(question8Result.choiceAnswers!)")
                    }
                    else
                    {
                        print("question 8 was skipped")
                    }
                }
                
                if let question9Result = taskResultValue.stepResult(forStepIdentifier: "question 9")?.results?.first as? ORKChoiceQuestionResult
                {
                    if question9Result.choiceAnswers != nil
                    {
                        print("Answer to question 9 is \(question9Result.choiceAnswers!)")
                    }
                    else
                    {
                        print("question 9 was skipped")
                    }
                }
                
                if let question10Result = taskResultValue.stepResult(forStepIdentifier: "question 10")?.results?.first as? ORKChoiceQuestionResult
                {
                    if question10Result.choiceAnswers != nil
                    {
                        print("Answer to question 10 is \(question10Result.choiceAnswers!)")
                    }
                    else
                    {
                        print("question 10 was skipped")
                    }
                }
                
                if let question11Result = taskResultValue.stepResult(forStepIdentifier: "question 11")?.results?.first as? ORKChoiceQuestionResult
                {
                    if question11Result.choiceAnswers != nil
                    {
                        print("Answer to question 11 is \(question11Result.choiceAnswers!)")
                    }
                    else
                    {
                        print("question 11 was skipped")
                    }
                }
                
                if let question12Result = taskResultValue.stepResult(forStepIdentifier: "question 12")?.results?.first as? ORKNumericQuestionResult
                {
                    if question12Result.numericAnswer != nil
                    {
                        print("Answer to question 12 is \(question12Result.numericAnswer!)")
                    }
                    else
                    {
                        print("question 12 was skipped")
                    }
                }
                
                if let question13Result = taskResultValue.stepResult(forStepIdentifier: "question 13")?.results?.first as? ORKTextQuestionResult
                {
                    if question13Result.textAnswer != nil
                    {
                        print("Answer to question 13 is \(question13Result.textAnswer!)")
                    }
                    else
                    {
                        print("question 13 was skipped")
                    }
                }
                
                if let question14Result = taskResultValue.stepResult(forStepIdentifier: "question 14")?.results?.first as? ORKNumericQuestionResult
                {
                    if question14Result.numericAnswer != nil
                    {
                        print("Answer to question 14 is \(question14Result.numericAnswer!)")
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
                
                if let question17Result = taskResultValue.stepResult(forStepIdentifier: "question 17")?.results?.first as? ORKNumericQuestionResult
                {
                    if question17Result.numericAnswer != nil
                    {
                        print("Answer to question 17 is \(question17Result.numericAnswer!)")
                    }
                    else
                    {
                        print("question 17 was skipped")
                    }
                }
                
                if let question18Result = taskResultValue.stepResult(forStepIdentifier: "question 18")?.results?.first as? ORKChoiceQuestionResult
                {
                    if question18Result.choiceAnswers != nil
                    {
                        print("Answer to question 18 is \(question18Result.choiceAnswers!)")
                    }
                    else
                    {
                        print("question 18 was skipped")
                    }
                }
                
                if let question19Result = taskResultValue.stepResult(forStepIdentifier: "question 19")?.results?.first as? ORKNumericQuestionResult
                {
                    if question19Result.numericAnswer != nil
                    {
                        print("Answer to question 19 is \(question19Result.numericAnswer!)")
                    }
                    else
                    {
                        print("question 19 was skipped")
                    }
                }
                
                if let question20Result = taskResultValue.stepResult(forStepIdentifier: "question 20")?.results?.first as? ORKNumericQuestionResult
                {
                    if question20Result.numericAnswer != nil
                    {
                        print("Answer to question 20 is \(question20Result.numericAnswer!)")
                    }
                    else
                    {
                        print("question 20 was skipped")
                    }
                }
                
                if let compStepResult = taskResultValue.stepResult(forStepIdentifier: "Completion Step")
                {
                    print("Completion Step started at : \(compStepResult.startDate)   Ended at : \(compStepResult.endDate)")
                }
            }
        }
        
}

}

