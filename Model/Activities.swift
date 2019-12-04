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
        let timedDiscussion = Activities(title: "Timed Discussion", image: "atv1_c")
        let funnySpeach = Activities(title: "FunnySpeech", image: "atv2_c")
        let theSentencesActivity = Activities(title: "TimedDiscussion", image: "atv3_c")

        
        return [timedDiscussion,funnySpeach,theSentencesActivity]
    }
    
    static func fetchActivitiesFamiliarity()-> [Activities]{
        let soundOfSilence = Activities(title: "SoundOfSilence", image: "SoundOfSilence")
        let questionsOfCoupleTherapy = Activities(title: "QuestionsOfCoupleTherapy", image: "QuestionsOfCoupleTherapy")
        return [soundOfSilence,questionsOfCoupleTherapy]
    }
}
