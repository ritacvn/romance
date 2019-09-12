//
//  TurnViewController.swift
//  romance
//
//  Created by Rita de Cássia Vasconcelos do Nascimento on 12/09/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import UIKit

class TurnViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    var timer = Timer()
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(TelaCronometroViewController.counter), userInfo: nil, repeats: true)
    }
    
    @objc func counter(){
        count += 1
        if count >= 0 {
            timerLabel.text = "0\(count)"
           
        }
    }
       
}
  

