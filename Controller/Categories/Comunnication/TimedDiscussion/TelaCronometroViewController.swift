//
//  TelaCronometroViewController.swift
//  romance
//
//  Created by Rita de Cássia Vasconcelos do Nascimento on 29/08/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import UIKit
import AudioToolbox
import Motion


class TelaCronometroViewController: UIViewController {

// MARK: Variables and Constants
    
    //var endTurn: Bool = false
    //var change: Bool = false
    
    var theme: String = ""
    
    var endTurn: Int = 0
    
    //var i = 0
   
    let name1 = UserDefaults.standard.string(forKey: "initialName01")
    let name2 = UserDefaults.standard.string(forKey: "initialName02")
    
    var randomTheme: Int = 0
    var countVariable: Int = 0
    
    //Time Variables
    var timer = Timer()
    var time: Int = 60
    var count: Int = 0
    var minute: Int = 0
    var second: Int = 0
    
//MARK: Outlets
    
    //Botoes de iniciar
    @IBOutlet weak var buttonStartOutlet: UIButton!
    @IBOutlet weak var buttonStartOutlet2: UIButton!
    
    //Nomes dos parceiros
    @IBOutlet weak var name1Outlet: UILabel!
    @IBOutlet weak var name2Outlet: UILabel!
    
    //Baloes
    @IBOutlet weak var balloonA: UIImageView!
    @IBOutlet weak var balloonB: UIImageView!
    
    //Theme labels
    @IBOutlet weak var theThemeIsLabel: UILabel!
   
    //Time Label
    @IBOutlet weak var clockLabel: UILabel!
    
//MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonStartOutlet.isHidden = false
        buttonStartOutlet2.isHidden = true
        
        updadeTheme()
        theThemeIsLabel.text = "\(String(describing: theme))!"
       
        name1Outlet.text = "Get ready \(String(describing: name1!))"
        name2Outlet.text = "Get ready \(String(describing: name2!))"
        
        balloonA.image = UIImage(named: "balao1W")
        balloonB.image = UIImage(named: "balao2W")
        
        clockLabel.text = "01:00"
        
    }
    
//MARK: Functions
    
    func updadeTheme(){
        randomTheme = Int.random(in: 0 ... 5)
        theme = arrayDeTemas_Dinamica03[randomTheme]
    }
       
    @IBAction func startButton(_ sender: Any) {
        
        balloonA.image = UIImage(named: "balao1B")
        name1Outlet.text = "It's your turn \(String(describing: name1!))!"
        
        timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(TelaCronometroViewController.counter), userInfo: nil, repeats: true)
        
        UIFeedback.hapticFeedback()
        
        buttonStartOutlet2.isHidden = true
        buttonStartOutlet.isHidden = true
        
    }
    
    @IBAction func startButton2(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(TelaCronometroViewController.counter), userInfo: nil, repeats: true)
              
        buttonStartOutlet2.isHidden = true
                   
        UIFeedback.hapticFeedback()
    }

@objc func counter(){
        
        
        minute =  time/60
        second = time%60
        
        if time >= 70{
            
            clockLabel.text = "\(String(minute)):\(String(second))"
            time -= 1
        }
            
        else if time > 60{
            clockLabel.text = "0\(String(minute)):0\(String(second))"
            time -= 1
        }
            
        else if time == 60{
            clockLabel.text = "01:00"
            time -= 1
        }
        else if time < 60 && time >= 10{
            clockLabel.text = "00:\(String(second))"
            // timerLabel.text = String(time)
            time -= 1
        }
        else if time < 10{
            clockLabel.text = "00:0\(String(second))"
            time -= 1
        }
        if time < 0{
            
            self.timer.invalidate()
            
        }
        if clockLabel.text == "00:00" {
            
            endTurn += 1
            
            clockLabel.text = "01:00"
            
            balloonB.image = UIImage(named: "balao2B")
            name2Outlet.text = "It's your turn \(String(describing: name2!))!"
            
            balloonA.image = UIImage(named: "balao1W")
            name1Outlet.text = "Thank you \(String(describing: name1!))!"
           
            buttonStartOutlet2.isHidden = false
            buttonStartOutlet.isHidden = true
            
            timer.invalidate()
            
            time = 60
            
            if endTurn == 2 {
                performSegue(withIdentifier: "endSegue", sender: self)
                           
            }
            
        }
        
    }

}
