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
    var time: Int = 10
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
        
        clockLabel.text = "1:00"
        
//        if clockLabel.text == "00:05" {
//            animateSize_Unscale(ballon: balloonA)
//        }
        
    }
    
//MARK: Functions
    
    func updadeTheme(){
        randomTheme = Int.random(in: 0 ... 5)
        theme = arrayDeTemas_Dinamica03[randomTheme]
    }
       
    @IBAction func startButton(_ sender: Any) {
            
        name1Outlet.text = "It's your turn \(String(describing: name1!))!"
        
        timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(TelaCronometroViewController.counter), userInfo: nil, repeats: true)
        
        UIFeedback.hapticFeedback()
        
        buttonStartOutlet2.isHidden = true
        
//            UIFeedback.hapticFeedback()
//            buttonStartOutlet.isHidden = true
//            timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(TelaCronometroViewController.counter), userInfo: nil, repeats: true)
//
//            animateSize_Scale(ballon: balloonA)
//            name1Outlet.text = "It's your turn: \(String(describing: name1!))!"
//
//            theThemeIsLabel.text = "\(String(describing: theme))!"
//    //        theThemeIsLabel.text = "Argue about the: \(String(describing: theme))!"
//            buttonStartOutlet2.isHidden = true
            
    }
    
    @IBAction func startButton2(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(TelaCronometroViewController.counter), userInfo: nil, repeats: true)
              
        buttonStartOutlet2.isHidden = true
                   
        UIFeedback.hapticFeedback()
    
//        //Haptic feedback
//        UIFeedback.hapticFeedback()
//
//        //Unscale ballon A
//        animateSize_Unscale(ballon: balloonA)
//
//        name1Outlet.text = "Thank you: \(String(describing: name1!))!"
//
//        //Para o Tempo
//        timer.invalidate()
//
//        //Reinicia o tempo
//        timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(TelaCronometroViewController.counter), userInfo: nil, repeats: true)
//
//        //Scale ballon B
//        animateSize_Scale(ballon: balloonB)
//
//        theThemeIsLabel.text = "\(String(describing: theme))"
////        theThemeIsLabel.text = "Argue about: \(String(describing: theme))"
//        name2Outlet.text = "It's your turn: \(String(describing: name2!))!"
//        buttonStartOutlet2.isHidden = true
  
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
            
            clockLabel.text = "1:00"
            name2Outlet.text = "It's your turn \(String(describing: name2!))!"
            name1Outlet.text = "Thank you \(String(describing: name1!))!"
           
            buttonStartOutlet2.isHidden = false
            buttonStartOutlet.isHidden = true
            
            timer.invalidate()
            
            time = 10
            
            if endTurn == 2 {
                performSegue(withIdentifier: "endSegue", sender: self)
                           
            }
            
//            animateSize_Unscale(ballon: balloonA)
//            timer.invalidate()
//                        buttonStartOutlet.isHidden = true
//                        buttonStartOutlet2.isHidden = false
//                        buttonStartOutlet2.isEnabled = true
//                        second = 0
//                        minute = 0
//                        time = 10
//            clockLabel.text = "01:00"
//
            
//            if clockLabel.text == "01:00" && buttonStartOutlet2.isEnabled == true{
//
//                animateSize_Unscale(ballon: balloonA)
//
//                //Unscale ballonB
//                animateSize_Unscale(ballon: balloonB)
//
//                if endTurn == true && name2Outlet.text == "It's your turn: \(String(describing: name1!))!" {
//                    name2Outlet.text = "Thank you: \(String(describing: name2!))!"
//
//                    performSegue(withIdentifier: "endSegue", sender: self)
//                }
//
//            }
        }
        
    }
    
    
//MARK: Animation
    
//    func animateSize_Scale(ballon: UIImageView) {
//
//        ballon.animate( [.delay(1),
//                           .duration(0.5),
//                           .size(CGSize(width: 244, height: 251))
//                            ]
//        )
//    }
//
//    func animateSize_Unscale(ballon: UIImageView) {
//
//        ballon.animate(.delay(1),.duration(0.5),.size(CGSize(width: 198, height: 204)))
//
//        if ballon == balloonB{
//             endTurn = true
//        }
//
//        if ballon == balloonA{
//            change = true
//        }
//
//    }

}
