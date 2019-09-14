//
//  TurnViewController.swift
//  romance
//
//  Created by Rita de Cássia Vasconcelos do Nascimento on 12/09/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import UIKit

class TurnViewController: UIViewController {
    
    var name1: String = ""
    var name2: String = ""
    
    @IBOutlet weak var parterName: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    var timer = Timer()
    var time = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parterName.text = "It's your turn \(name2)!"
        
        //Time
        timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(TelaCronometroViewController.counter), userInfo: nil, repeats: true)
    }
    
    @objc func counter(){
        
        time -= 1
        timerLabel.text = "\(time)"
        
        if time <= 0 {
            self.timer.invalidate()
            performSegue(withIdentifier: "goToActivitySegue", sender: self)
        }
        
    }
    
    
}
  

