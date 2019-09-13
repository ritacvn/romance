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
    

    var nome1: String = ""
    var nome2: String = ""
    
    //time variables
    var timer = Timer()
    var count: Int = 0
    var minute: Int = 0
    var second: Int = 0
    
//MARK: Outlets

    
    @IBOutlet weak var fraseRandomizada: UILabel!
    
    //Time labels
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    

//MARK: Actions
    
    @IBAction func startActivity(_ sender: Any) {
       
        count = 0
        minute = 0
        minuteLabel.text = "00"
        secondLabel.text = "00"
        
        timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(TelaCronometroViewController.counter), userInfo: nil, repeats: true)
        
    }
    

//MARK: Functions
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomizarFrase()
        print(nome1)
        print(nome2)
    }
    
    //Phrase to randomize phrase
    func randomizarFrase(){
        frase = Int.random(in: 0...3)
        fraseRandomizada.text = arrayDeFrases[frase]
    }
    
    //Time Logic
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
    }

}
