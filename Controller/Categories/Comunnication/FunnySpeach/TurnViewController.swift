//
//  TurnViewController.swift
//  romance
//
//  Created by Rita de Cássia Vasconcelos do Nascimento on 12/09/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import UIKit
let finishButonNotificationKey = "finishButtonTapped"

class TurnViewController: UIViewController {
    
    var couple: Couple?
    var end: Bool?
    
    let finishButton = Notification.Name(rawValue: finishButonNotificationKey)
    
//    let name1 = UserDefaults.standard.string(forKey: "initialName01")
//    let name2 = UserDefaults.standard.string(forKey: "initialName02")
    
    let name1 = UserDefaults.standard.string(forKey: "initialName01")
    let name2 = UserDefaults.standard.string(forKey: "initialName02")

    var timer = Timer()
    var time = 5
    
    @IBOutlet weak var parterName: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("partnerTurn \(String(describing: couple?.partnerTurn()))")
        
        createObserves()
        if couple?.partnerTurn() == 1 {
            
            parterName.text = "It's your turn:  \(String(describing: name1))!"
            
        } else if couple?.partnerTurn() == 2 {
            
            parterName.text = "It's your turn:  \(String(describing: name2))!"
        }
        
        
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
//
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let displayVC = segue.destination as! CardTelaViewController
        displayVC.couple = self.couple
    }
    
    func createObserves(){
           
           //Check if finishButton waas tapped
           NotificationCenter.default.addObserver(self, selector: #selector(TurnViewController.updadeName(notification:)), name: finishButton, object: nil)
           
    }
    
    @objc func updadeName(notification: NSNotification){
        
        
    }
    
}
  

