//
//  QOCTActivityScreenViewController.swift
//  romance
//
//  Created by Eliza Maria Porto de Carvalho on 22/10/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import Foundation
import UIKit

class QOCTActivityScreenViewController: UIViewController{
    
    var theme: String = ""
    var endTurn: Int = 0
    
    //Time Variables
    var timer = Timer()
    var time: Int = 60
    var count: Int = 0
    var minute: Int = 0
    var second: Int = 0
    
    let name1 = UserDefaults.standard.string(forKey: "initialName01")
    let name2 = UserDefaults.standard.string(forKey: "initialName02")
    
    @IBOutlet weak var mainThemeOutlet: UILabel!
    @IBOutlet weak var timeOutlet: UILabel!
    @IBOutlet weak var partnerNameOutlet: UILabel!
    
    
    @IBOutlet weak var buttonStart01: UIButton!
    @IBOutlet weak var buttonStart02: UIButton!
    
    override func viewDidLoad() {
        
        buttonStart01.isHidden = false
        buttonStart02.isHidden = true
        
        mainThemeOutlet.text = "Tap start to receive a question!"
        partnerNameOutlet.text = "Hello, \(String(describing: name1!)) and \(String(describing: name2!))!"
        timeOutlet.text = "1:00"
        
    }
    
    //Randomizing the theme
    func updadeTheme(){
        let randomTheme = Int.random(in: 0 ... 4)
        theme = arrayOfQuests_Act1F[randomTheme]
    }
       
    @IBAction func startButton(_ sender: Any) {
        
        updadeTheme()
        
        partnerNameOutlet.text = "It's your time to share your thougts \(String(describing: name1!))!"
        mainThemeOutlet.text = "\(String(describing: theme))"

        
        timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(TelaCronometroViewController.counter), userInfo: nil, repeats: true)
        
        UIFeedback.hapticFeedback()
        
        buttonStart01.isHidden = true
        
    }
    
    @IBAction func startButton02(_ sender: Any) {
       
        timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(TelaCronometroViewController.counter), userInfo: nil, repeats: true)
       
        buttonStart02.isHidden = true
            
        UIFeedback.hapticFeedback()
        
    }
    
    
    @objc func counter(){

         minute =  time/60
         second = time%60
         
         if time >= 70{
             
             timeOutlet.text = "\(String(minute)):\(String(second))"
             time -= 1
         }
             
         else if time > 60{
             timeOutlet.text = "0\(String(minute)):0\(String(second))"
             time -= 1
         }
             
         else if time == 60{
             timeOutlet.text = "01:00"
             time -= 1
         }
         else if time < 60 && time >= 10{
             timeOutlet.text = "00:\(String(second))"
             // timerLabel.text = String(time)
             time -= 1
         }
         else if time < 10{
             timeOutlet.text = "00:0\(String(second))"
             time -= 1
         }
         if time < 0{
             
             self.timer.invalidate()
             
         }
         if timeOutlet.text == "00:00" {
             timer.invalidate()
            
            endTurn += 1
            
            timeOutlet.text = "1:00"
            partnerNameOutlet.text = "Now it's your time \(String(describing: name2!))!"
            buttonStart02.isHidden = false
            timer.invalidate()
            
            //randomizarFrase()
            time = 60
            
            print(endTurn)
            
            if endTurn == 2 {
                performSegue(withIdentifier: "EndQOCTScreen", sender: self)
                
            }
            
         }
        
     }

}
