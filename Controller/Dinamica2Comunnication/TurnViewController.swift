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
    
    let finishButton = Notification.Name(rawValue: finishButonNotificationKey)
    
    var timer = Timer()
    var time = 5
    
    @IBOutlet weak var parterName: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
   
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createObserves()
        
        parterName.text = "It's your turn \(String(describing: couple!.partnerTurn()))!"
        
        //Time
        timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(TelaCronometroViewController.counter), userInfo: nil, repeats: true)
    }
    
    func createObserves(){
        
        //Check if finishButton waas tapped
        NotificationCenter.default.addObserver(self, selector: #selector(TurnViewController.updadeName(notification:)), name: finishButton, object: nil)
        
    }
    
    @objc func updadeName(notification: NSNotification){
        
        
    }
    
    @objc func counter(){
        
        time -= 1
        timerLabel.text = "\(time)"
        
        if time <= 0 {
            self.timer.invalidate()
            performSegue(withIdentifier: "goToActivitySegue", sender: self)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let displayVC = segue.destination as! CardTelaViewController
        displayVC.couple = self.couple
     
    }
    
    
}
  

