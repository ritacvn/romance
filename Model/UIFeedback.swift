//
//  UIFeedback.swift
//  romance
//
//  Created by Eliza Maria Porto de Carvalho on 27/09/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import Foundation
import UIKit

class UIFeedback {
    
    class func hapticFeedback(){
        
        let impact = UISelectionFeedbackGenerator()
        impact.selectionChanged()
        
    }
 
}
