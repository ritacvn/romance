//
//  SecondTurnViewController.swift
//  romance
//
//  Created by Eliza Maria Porto de Carvalho on 01/12/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import Foundation


import UIKit
let finishButonNotificationKey = "finishButtonTapped"

class SecondTurnViewController: UIViewController {
    
    var couple: Couple?
    var end: Bool?
      
    let name1 = UserDefaults.standard.string(forKey: "initialName01")
    let name2 = UserDefaults.standard.string(forKey: "initialName02")

    var timer = Timer()
    var time = 5
    
    @IBOutlet weak var parterName: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
   
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("partnerTurn \(String(describing: couple?.partnerTurn()))")
        
        parterName.text = "It's your turn \(String(describing: couple?.partnerTurn()))"
        
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
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let displayVC = segue.destination as! CardTelaViewController
//        displayVC.couple = self.couple
//        //displayVC.end = self.end
//    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let displayVC = segue.destination as! CardTelaViewController
        displayVC.couple = self.couple
        displayVC.end = self.end
     
    }
    

    
}
  

