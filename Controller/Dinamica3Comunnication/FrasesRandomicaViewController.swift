//
//  FrasesRandomicaViewController.swift
//  romance
//
//  Created by Rita de Cássia Vasconcelos do Nascimento on 11/09/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import UIKit

class FrasesRandomicaViewController: UIViewController {
   
//MARK: Varibles and Constants
    
    var frase: Int = 0
    
    var couple: Couple?
    
    //time variables
    var timer = Timer()
    var time: Int = 10
    var count: Int = 0
    var minute: Int = 0
    var second: Int = 0
    
//MARK: Outlets
    
    @IBOutlet weak var fraseRandomizada: UILabel!
    //Time labels
    @IBOutlet weak var clockLabel: UILabel!

//MARK: Actions
    
    @IBAction func startActivity(_ sender: Any) {
       
        count = 00
        minute = 00
      
        timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(TelaCronometroViewController.counter), userInfo: nil, repeats: true)
        
    }
    

//MARK: Functions
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomizarFrase()
        
    }
    
    //Func to randomize phrase
    func randomizarFrase(){
        frase = Int.random(in: 0...3)
        fraseRandomizada.text = arrayDeFrases[frase]
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
    }
    

}
