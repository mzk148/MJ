//
//  Consent.swift
//  Onboarding
//
//  Created by Stella Cho on 11/9/17.
//  Copyright © 2017 Stella Cho. All rights reserved.
//

import Foundation
import ResearchKit

/*********************************************************************************/
//MARK: - RK Tasks
/*********************************************************************************/
extension ConsentVC
{
    
    
    func visualConsentTask() -> ORKTask
    {
        let document = consentDocument()
        let visualConsentStep = ORKVisualConsentStep(identifier: "VisualConsentStep", document: document)
        
        let investigatorShortDescription = NSLocalizedString("Institution", comment: "")
        let investigatorLongDescription = NSLocalizedString("Institution and its partners", comment: "")
        let localizedLearnMoreHTMLContent = NSLocalizedString("Learn more content here.", comment: "")
        
        let sharingConsentStep = ORKConsentSharingStep(identifier: "ConsentSharingStep",
                                                       investigatorShortDescription: investigatorShortDescription,
                                                       investigatorLongDescription: investigatorLongDescription,
                                                       localizedLearnMoreHTMLContent: localizedLearnMoreHTMLContent)
        
        let signature = document.signatures!.first  //  The first signature is the participant's
        //  Note: to prevent the app from asking for the participant's signature, pass nil for the `signature` parameter.
        signature!.requiresName = false
        let reviewConsentStep = ORKConsentReviewStep(identifier: "ConsentReviewStep", signature: signature, in: document)
        
        reviewConsentStep.reasonForConsent = "If you reviewed the consent thoroughly and agree to join with us, click Agree button. If not, click Cancel to go back."
        
        let consentSteps = [visualConsentStep, sharingConsentStep, reviewConsentStep]
        
        return ORKOrderedTask(identifier: "ConsentTask", steps: consentSteps)
    }
    
    func consentDocument() -> ORKConsentDocument
    {
        let consentDocument = ORKConsentDocument()
        
        consentDocument.title = "Example Consent"
        consentDocument.signaturePageTitle = "Consent"
        consentDocument.signaturePageContent = "I agree to participate in this research study."
        
        //  Must have at least one signature
        let participantSignature = ORKConsentSignature(forPersonWithTitle: "Participant", dateFormatString: nil, identifier: "ConsentDocumentParticipantSignature")
        
        consentDocument.addSignature(participantSignature)
        
        
        //  PDF-only items
        let investigatorsignatureImage: UIImage? = nil
        
        let investigatorSignature = ORKConsentSignature(forPersonWithTitle: "Investigator",
                                                        dateFormatString: nil,
                                                        identifier: "ConsentDocumentInvestigatorSignature",
                                                        givenName: "John",
                                                        familyName: "Smith",
                                                        signatureImage: investigatorsignatureImage,
                                                        dateString: "3/9/15")
        
        consentDocument.addSignature(investigatorSignature)
        
        /*
         If your content is just text, you can use the `content` property
         instead of the `htmlContent` property of `ORKConsentSection`.
         */
        let text = "OOOOverview"
        let htmlContentString = "<ul><li>Lorem</li><li>ipsum</li><li>dolor</li></ul><p>\(text)</p><p>\(text)</p>"
        
        let overviewSection = ORKConsentSection(type: .overview)
        overviewSection.summary = "Welcome to this study. You'll be introduced with informed consent in the next few steps. Thank you 😀"
        overviewSection.content = "This is a study focused on..."
        overviewSection.htmlContent = htmlContentString
        overviewSection.formalTitle = "formal title"
        
        let dataGatheringSection = ORKConsentSection(type: .dataGathering)
        dataGatheringSection.summary = "We will inform you that sensor data will be collected."
        dataGatheringSection.content = "The sensors we use for data collection are ... You can also access your data, and use them for tracking or..."
        
        let privacySection = ORKConsentSection(type: .privacy)
        privacySection.summary = "Privacy is the number one we concern. Seriously."
        privacySection.content = "We keep every single user's information private."
        
        let dataUseSection = ORKConsentSection(type: .dataUse)
        dataUseSection.summary = "Your collected data will only be used for this research purposes."
        dataUseSection.content = "Data will never be used for any other purpose."
        
        let timeCommitmentSection = ORKConsentSection(type: .timeCommitment)
        timeCommitmentSection.summary = "The amount of time you play with 'App name' can be various depending on your activity."
        timeCommitmentSection.content = "Some parts of Survey and Tasks should be performed monthly, biweekly, or daily. But, remember! We are not forcing you. It's your responsibility."
        
        let studySurveySection = ORKConsentSection(type: .studySurvey)
        studySurveySection.summary = "The survey questions are focusing on ..."
        studySurveySection.content = "This describes the surveys used in the study and how the collected data will be used."
        
        let studyTasksSection = ORKConsentSection(type: .studyTasks)
        studyTasksSection.summary = "The task activities are focusing on ..."
        studyTasksSection.content = "This describes the active tasks used in the study, the purpose of the tasks, and any associated risk."
        
        let withdrawingSection = ORKConsentSection(type: .withdrawing)
        withdrawingSection.summary = "Goodbye now...👋"
        withdrawingSection.content = "If at anytime you wish to withdraw from the study simply delete the app from your iPhone... Don't forget to mention the study's policies regarding the collected data."
        
        let customSection = ORKConsentSection(type: .custom)
        customSection.summary = "Custom Summary"
        customSection.content = "Custom Content"
        
        
        let documentOnly = ORKConsentSection(type: .onlyInDocument)
        documentOnly.summary = "OnlyInDocument Scene Summary"
        documentOnly.title = "OnlyInDocument Scene"
        documentOnly.content = "Content for onlyindocument scene. - Wrapping up"
        
        consentDocument.sections = [overviewSection, dataGatheringSection, privacySection,
                                    dataUseSection, timeCommitmentSection, studySurveySection,
                                    studyTasksSection, withdrawingSection, customSection, documentOnly]
        
        return consentDocument
    }
}

/*********************************************************************************/
//MARK: - RK Results
/*********************************************************************************/
extension ConsentVC
{
    func processConsentResults(_ taskResult: ORKTaskResult?)
    {
        guard let taskResult = taskResult else { return }
        
        print("Task Id: ", taskResult.identifier)
        
        if let consentSharingStepResult = taskResult.stepResult(forStepIdentifier: "ConsentSharingStep"),
            let sharingResult = consentSharingStepResult.firstResult as? ORKChoiceQuestionResult
        {
            assert(sharingResult.questionType == .singleChoice)
            print("id", sharingResult.identifier)
            print("Answer", sharingResult.choiceAnswers![0])
        }
        
        
        let visualConsentStepResult = taskResult.stepResult(forStepIdentifier: "VisualConsentStep")
        let visualResult = visualConsentStepResult?.firstResult //  No results therefore will always be nil
        assert(visualResult == nil)
        
        if let consentReviewStepResult = taskResult.stepResult(forStepIdentifier: "ConsentReviewStep"),
            let reviewResult = consentReviewStepResult.firstResult as? ORKConsentSignatureResult
        {
            print("Consented? ", reviewResult.consented)
            
            if let signature = reviewResult.signature
            {
                print("Identifier:", signature.identifier)
                print("Title: ", signature.title)
                print("Given name: ", signature.givenName)
                print("Family name: ", signature.familyName)
                print("Signature image: ", signature.signatureImage)
                print("Signature date: ", signature.signatureDate)
            }
        }
        
    }
}


