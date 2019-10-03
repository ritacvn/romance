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
    var endTurn: Int = 0
    
    //time variables
    var timer = Timer()
    var time: Int = 60
    
    var fraseTema: String = ""
    
    var count: Int = 0
    var minute: Int = 0
    var second: Int = 0
    
//MARK: Outlets
    
    @IBOutlet weak var namePerson: UILabel!
    @IBOutlet weak var fraseRandomizada: UILabel!
    //Time labels
    @IBOutlet weak var clockLabel: UILabel!

    @IBOutlet weak var start2outlet: UIButton!
    @IBOutlet weak var start1outlet: UIButton!
    //MARK: Actions
    
    @IBAction func startActivity(_ sender: Any) {
        
        start1outlet.isEnabled = false
        start1outlet.isHidden = true
       
        //randomizarFrase()
        timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(FrasesRandomicaViewController.counter), userInfo: nil, repeats: true)
       
        UIFeedback.hapticFeedback()
    }
    
    @IBAction func startActivity2(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(FrasesRandomicaViewController.counter), userInfo: nil, repeats: true)
        
        start1outlet.isEnabled = false
        start2outlet.isHidden = true
        
        UIFeedback.hapticFeedback()
    
    }
    
//MARK: Functions
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        namePerson.text = "Hello, \(String(describing: couple!.partnerOne))!"
        
        randomizarFrase()
        fraseRandomizada.text = "What do you think about the sentence: \n \(fraseTema)."
        
        start2outlet.isEnabled = false
        start2outlet.isHidden = true
        
    }
    
    //Func to randomize phrase
    func randomizarFrase(){
        frase = Int.random(in: 0...3)
        fraseTema = arrayDeFrases[frase]
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
        
        if clockLabel.text == "00:00"{
            
            endTurn += 1
            
            namePerson.text = "Now it's your turn: \(String(describing: couple!.partnerTwo))!"
            timer.invalidate()
            
            start2outlet.isEnabled = true
            start2outlet.isHidden = false
            
            //randomizarFrase()
            time = 60
            
            print(endTurn)
            
            if endTurn == 2 {
                performSegue(withIdentifier: "endDin3Segue", sender: self)
                
            }
           
        }
        
        
    }
    

}
