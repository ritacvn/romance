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
    
    //Time Variables
    var timer = Timer()
    var time: Int = 60
    var count: Int = 0
    var minute: Int = 0
    var second: Int = 0
    
    @IBOutlet weak var mainThemeOutlet: UILabel!
    @IBOutlet weak var timeOutlet: UILabel!
    
    override func viewDidLoad() {
        updadeTheme()
        mainThemeOutlet.text = "\(String(describing: theme))"
    }
    
    //Randomizing the theme
    func updadeTheme(){
        let randomTheme = Int.random(in: 0 ... 3)
        theme = arrayOfQuests_Act1F[randomTheme]
    }
       
    @IBAction func startButton(_ sender: Any) {
        
        
        timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(TelaCronometroViewController.counter), userInfo: nil, repeats: true)
        
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
         }
        
     }
    
    
    
}
