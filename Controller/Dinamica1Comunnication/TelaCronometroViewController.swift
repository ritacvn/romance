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

//MARK: Variables and Constants
    
    var endTurn: Bool = false
    
    
    var i = 0
    
    //Name from set name Screen
    var couple: Couple?
    
    var randomTheme: Int = 0
    var countVariable: Int = 0
    
    //Time Variables
    var timer = Timer()
    var time: Int = 5
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
        
        name1Outlet.text = "Get ready \(String(describing: couple!.partnerOne))!"
        name2Outlet.text = "Get ready \(String(describing: couple!.partnerTwo))!"
        
        updadeTheme()
        
        buttonStartOutlet2.isHidden = true
        
        if clockLabel.text == "00:05" {
            animateSize_Unscale(ballon: balloonA)
        }
        
    }
    
    @IBAction func startButton2(_ sender: Any) {
        
        animateSize_Unscale(ballon: balloonA)
        name1Outlet.text = "Thank you \(String(describing: couple!.partnerOne))!"
        
        //Para o Tempo
        timer.invalidate()
        
        //Reinicia o tempo
        timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(TelaCronometroViewController.counter), userInfo: nil, repeats: true)
        
        //Scale ballon B
        animateSize_Scale(ballon: balloonB)
        name2Outlet.text = "It's your turn \(String(describing: couple!.partnerTwo))!"
        
        //buttonStartOutlet2.isEnabled = false
       // buttonStartOutlet2.isHidden = true
    
    }
    
//MARK: IBActions
    
    @IBAction func startButton(_ sender: Any) {
        
        
        timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(TelaCronometroViewController.counter), userInfo: nil, repeats: true)
        
        animateSize_Scale(ballon: balloonA)
        name1Outlet.text = "It's your turn \(String(describing: couple!.partnerOne))!"
        
        
        themeLabel.isHidden = true
        theThemeIsLabel.isHidden = true
        buttonStartOutlet.isHidden = true
        
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
                        time = 5
            
            clockLabel.text = "00:05"
            
            
            if clockLabel.text == "00:05" && buttonStartOutlet2.isEnabled == true{
               
                animateSize_Unscale(ballon: balloonA)
                
                //Unscale ballonB
                animateSize_Unscale(ballon: balloonB)
                
                if endTurn == true && name2Outlet.text == "It's your turn \(String(describing: couple!.partnerTwo))!" {
                    name2Outlet.text = "Thank you \(String(describing: couple!.partnerTwo))!"
                    
                    performSegue(withIdentifier: "endSegue", sender: self)
                }
                
            }
            
            
        }
        
    }

    
  
    
//MARK: Functions
    
    //Randomizing the theme
    func updadeTheme(){
        randomTheme = Int.random(in: 0 ... 5)
        themeLabel.text = arrayDeTemas_Dinamica03[randomTheme]
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
       
    }
    
}
