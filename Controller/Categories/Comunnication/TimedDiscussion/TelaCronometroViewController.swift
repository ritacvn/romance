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
    
    var endTurn: Bool = false
    var change: Bool = false
    
//    let name1 = UserDefaults.standard.string(forKey: "name1")
//    let name2 = UserDefaults.standard.string(forKey: "name2")
    var i = 0
    
    //Theme variables
    var theme: String = ""
    
    //Importing classes
    
    //Name from set name Screen
    //var couple: Couple?
    
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
    
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var buttonStartOutlet: UIButton!
    @IBOutlet weak var acabouLabel: UILabel!
    @IBOutlet weak var name1Outlet: UILabel!
    @IBOutlet weak var name2Outlet: UILabel!
    @IBOutlet weak var nextPersonButtonOutlet: UIButton!
    @IBOutlet weak var buttonStartOutlet2: UIButton!
    
    //Baloes
    @IBOutlet weak var balloonA: UIImageView!
    @IBOutlet weak var balloonB: UIImageView!
    
    //Theme labels
    @IBOutlet weak var theThemeIsLabel: UILabel!
    @IBOutlet weak var themeLabel: UILabel!
    
    //Time Label
    @IBOutlet weak var clockLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        name1Outlet.text = "Get ready \(String(describing: name1!))"
        name2Outlet.text = "Get ready \(String(describing: name2!))"
        
        updadeTheme()
        theThemeIsLabel.text = "\(String(describing: theme))!"
//        theThemeIsLabel.text = "The theme is: \(String(describing: theme))!"
        
        buttonStartOutlet2.isHidden = true
        
        if clockLabel.text == "00:05" {
            animateSize_Unscale(ballon: balloonA)
        }
        
    }
    
    @IBAction func startButton2(_ sender: Any) {
    
        //Haptic feedback
        UIFeedback.hapticFeedback()
        
        //Unscale ballon A
        animateSize_Unscale(ballon: balloonA)
        
        name1Outlet.text = "Thank you: \(String(describing: name1!))!"
       
        //Para o Tempo
        timer.invalidate()
        
        //Reinicia o tempo
        timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(TelaCronometroViewController.counter), userInfo: nil, repeats: true)
        
        //Scale ballon B
        animateSize_Scale(ballon: balloonB)

        theThemeIsLabel.text = "\(String(describing: theme))"
//        theThemeIsLabel.text = "Argue about: \(String(describing: theme))"
        name2Outlet.text = "It's your turn: \(String(describing: name2!))!"
        buttonStartOutlet2.isHidden = true
  
    }
    
//MARK: IBActions
    
    @IBAction func startButton(_ sender: Any) {
        
        //Haptic feedback
        UIFeedback.hapticFeedback()
        buttonStartOutlet.isHidden = true
        timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(TelaCronometroViewController.counter), userInfo: nil, repeats: true)
        
        animateSize_Scale(ballon: balloonA)
        name1Outlet.text = "It's your turn: \(String(describing: name1!))!"

        theThemeIsLabel.text = "\(String(describing: theme))!"
//        theThemeIsLabel.text = "Argue about the: \(String(describing: theme))!"
        buttonStartOutlet2.isHidden = true
        
    }
    
    @IBAction func nextPersonButton(_ sender: Any) {
        
    }
    
    
    //Time Logic
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
            
            animateSize_Unscale(ballon: balloonA)
            timer.invalidate()
                        buttonStartOutlet.isHidden = true
                        buttonStartOutlet2.isHidden = false
                        buttonStartOutlet2.isEnabled = true
                        second = 0
                        minute = 0
                        time = 60
            clockLabel.text = "01:00"
            
            
            
            if clockLabel.text == "01:00" && buttonStartOutlet2.isEnabled == true{
               
                animateSize_Unscale(ballon: balloonA)
                
                //Unscale ballonB
                animateSize_Unscale(ballon: balloonB)
                
                if endTurn == true && name2Outlet.text == "It's your turn: \(String(describing: name1!))!" {
                    name2Outlet.text = "Thank you: \(String(describing: name2!))!"
                    
                    performSegue(withIdentifier: "endSegue", sender: self)
                }
                
            }
        }
        
        
    }

    
  
    
//MARK: Functions
    
    //Randomizing the theme
    func updadeTheme(){
        randomTheme = Int.random(in: 0 ... 5)
        theme = arrayDeTemas_Dinamica03[randomTheme]
    }
    
    func animateSize_Scale(ballon: UIImageView) {
        
        ballon.animate( [.delay(1),
                           .duration(0.5),
                           .size(CGSize(width: 244, height: 251))
                            ]
        )
    }
    
    func animateSize_Unscale(ballon: UIImageView) {
        
        ballon.animate(.delay(1),.duration(0.5),.size(CGSize(width: 198, height: 204)))
        
        if ballon == balloonB{
             endTurn = true
        }
        
        if ballon == balloonA{
            change = true
        }
       
    }
    
}
