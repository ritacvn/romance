 //
//  Motion.swift
//  romance
//
//  Created by Rita de Cássia Vasconcelos do Nascimento on 02/10/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import Motion
import UIKit
import Foundation
 
 class Motion {
    var ballon: UIImageView

    init(ballon: UIImageView) {
        self.ballon = ballon
    }
    
    func animate_Scale(ballon: UIImageView){
        ballon.animate( [.delay(1),
                                 .duration(0.5),
                                 .size(CGSize(width: 244, height: 251))
                                  ]
              )
    }
 }
