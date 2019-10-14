//
//  PlayScreenViewController.swift
//  romance
//
//  Created by Rita de Cássia Vasconcelos do Nascimento on 08/10/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import UIKit
import MBCircularProgressBar

class PlayScreenViewController: UIViewController {
    
    var time: String?
    var timeConverted: Int?
    var timer = Timer()
    var minute: Int = 0
    var second: Int = 0
    
    @IBOutlet weak var labelTime: UILabel!
    
    @IBOutlet weak var progressView: MBCircularProgressBarView!
    
    @IBOutlet weak var clockLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTime.text = time
        timeConverted = Int(time!) ?? 0
        self.progressView.value = 0
    }
    
   
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.0) {
            self.progressView.value = 80
        }
    }


}
