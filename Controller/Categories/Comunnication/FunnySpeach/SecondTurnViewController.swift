//
//  SecondTurnViewController.swift
//  romance
//
//  Created by Eliza Maria Porto de Carvalho on 01/12/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import Foundation


import UIKit
class SecondTurnViewController: UIViewController {
    
    let name2 = UserDefaults.standard.string(forKey: "initialName02")

    var timer = Timer()
    var time = 10
    
    @IBOutlet weak var secondTimerLabel: UILabel!
    @IBOutlet weak var secondPartnerLabel: UILabel!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
       secondPartnerLabel.text = "It's your turn \(String(describing: name2!))"
        
        //Time
        timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(TelaCronometroViewController.counter), userInfo: nil, repeats: true)
    }
    

    @objc func counter(){
        
        time -= 1
        secondTimerLabel.text = "\(time)"
        
        if time <= 0 {
            self.timer.invalidate()
            performSegue(withIdentifier: "secondCardVC", sender: self)
        }
    
    }
    
}
  

