//
//  PlayScreenViewController.swift
//  romance
//
//  Created by Rita de Cássia Vasconcelos do Nascimento on 08/10/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import UIKit

class PlayScreenViewController: UIViewController {
    
    var time: String?
    
    @IBOutlet weak var labelTime: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTime.text = time
       
    }
    


}
