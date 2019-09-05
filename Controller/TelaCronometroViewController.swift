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
    //MARK: Variables
    var count = 0
    var minute = 0
    var hour = 0
    var i = 0
    var timer = Timer()
    var name1: String?
    var name2: String?
    var randomTheme: Int = 0
    
    //MARK: Outlets
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var buttonStartOutlet: UIButton!
    @IBOutlet weak var acabouLabel: UILabel!
    @IBOutlet weak var name1Outlet: UILabel!
    @IBOutlet weak var name2Outlet: UILabel!
    @IBOutlet weak var nextPersonButtonOutlet: UIButton!
    
    //Baloes
    @IBOutlet weak var balloonA: UIImageView!
    @IBOutlet weak var balloonB: UIImageView!
    
    //Theme labels
    @IBOutlet weak var theThemeIsLabel: UILabel!
    @IBOutlet weak var themeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name1Outlet.text = name1
        name2Outlet.text = name2
        
        updadeTheme()
        
        minuteLabel.isHidden = true
        secondLabel.isHidden = true

    }
    
    //MARK: IBAction
    @IBAction func startButton(_ sender: Any) {
        buttonStartOutlet.isEnabled = false
        timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(TelaCronometroViewController.counter), userInfo: nil, repeats: true)
        animateSize_Scale()
        
        themeLabel.isHidden = true
        theThemeIsLabel.isHidden = true
        
        minuteLabel.isHidden = false
        secondLabel.isHidden = false
        
        
    }
    
    @IBAction func nextPersonButton(_ sender: Any) {
    }
    @objc func counter(){
        count += 1
        if count >= 0 {
            secondLabel.text = "0\(count)"
            if count == 60 {
                count = 0
                secondLabel.text = "00"
                minute += 1
                    if minute >= 0 {
                    minuteLabel.text = "\(minute)"
                    if minute == 60 {
                        minute = 0
                        minuteLabel.text = "00"
                    }
                }
                else{
                    minuteLabel.text = "0\(minute)"
                }
            }
    }
        if minuteLabel.text == "00" && secondLabel.text == "06"{
//            acabouLabel.text = "CABBOU MEU FILHO"
           timer.invalidate()
            buttonStartOutlet.isEnabled = true
            if buttonStartOutlet.isEnabled == true {
                print("play again")
                
            }
////                for _ in 0...1{
////                    AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
////                    sleep(1)
////                }
//            acabouLabel.isHidden = true
//            animateSize_Unscale()
//            balloonB.animate( [.delay(1),
//                               .duration(0.5),
//                               .size(CGSize(width: 595, height: 620))
//                ]
//            )
//            timer.invalidate()
//
//
//            count = 0
//            minute = 0
//            minuteLabel.text = "00"
//            secondLabel.text = "00"
//
//            while minuteLabel.text != "00"{
//            timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(TelaCronometroViewController.counter), userInfo: nil, repeats: true)
//            if minuteLabel.text == "00" && secondLabel.text == "05"{
//                timer.invalidate()
////                for _ in 0...3{
////                    AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
////                    sleep(1)
////
////                }
//                balloonB.animate(.delay(1),.duration(0.5),.size(CGSize(width: 385, height: 403)))
//
//            }
//            }
//
        }
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func resetButton(_ sender: Any) {
        timer.invalidate()
        count = 0
        minute = 0
        minuteLabel.text = "00"
        secondLabel.text = "00"
    }
    
    //MARK: Functions
    
    //Randomizing the theme
    func updadeTheme(){
        randomTheme = Int.random(in: 0 ... 5)
        themeLabel.text = arrayDeTemas_Dinamica03[randomTheme]
    }
    
    func animateSize_Scale() {
       //let size = balloonA.bounds.size
        
        balloonA.animate( [.delay(1),
                           .duration(0.5),
                           .size(CGSize(width: 595, height: 620))
                            ]
        )
       // balloonA.animate(.delay(1),.duration(0.5),.size(size))
    }
    
    func animateSize_Unscale() {
        
        balloonA.animate(.delay(1),.duration(0.5),.size(CGSize(width: 385, height: 403)))
        
    }
    
}
