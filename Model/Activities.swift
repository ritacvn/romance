//
//  Activities.swift
//  romance
//
//  Created by Rita de Cássia Vasconcelos do Nascimento on 26/11/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import Foundation

struct Activities {
    let title: String?
    let image: String?
    
    static func fetchActivitiesCommunication() -> [Activities]{
        let timedDiscussion = Activities(title: "Timed Discussion", image: "TimedDiscussion")
        let funnySpeach = Activities(title: "FunnySpeach", image: "FunnySpeech")
        let theSentencesActivity = Activities(title: "TimedDiscussion", image: "TheSentencesActivity")
        
        return [timedDiscussion,funnySpeach,theSentencesActivity]
    }
    
    static func fetchActivitiesFamiliarity()-> [Activities]{
        let soundOfSilence = Activities(title: "SoundOfSilence", image: "SoundOfSilence")
        let questionsOfCoupleTherapy = Activities(title: "QuestionsOfCoupleTherapy", image: "QuestionsOfCoupleTherapy")
        return [soundOfSilence,questionsOfCoupleTherapy]
    }
}
