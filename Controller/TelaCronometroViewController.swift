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
    
    
    //MARK: Outlets
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var buttonStartOutlet: UIButton!
    @IBOutlet weak var acabouLabel: UILabel!
    
    //Baloes
    @IBOutlet weak var balloonA: UIImageView!
    @IBOutlet weak var balloonB: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    //MARK: IBAction
    @IBAction func startButton(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(TelaCronometroViewController.counter), userInfo: nil, repeats: true)
        animateSize_Scale()
        
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
        if minuteLabel.text == "00" && secondLabel.text == "05"{
            acabouLabel.text = "CABBOU MEU FILHO"
            timer.invalidate()
            animateSize_Unscale()
            
            for _ in 0...10{ AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
                sleep(1)
            }
            
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
