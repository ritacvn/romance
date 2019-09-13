//
//  FrasesRandomicaViewController.swift
//  romance
//
//  Created by Rita de Cássia Vasconcelos do Nascimento on 11/09/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import UIKit

class FrasesRandomicaViewController: UIViewController {
    var frase: Int = 0
    
    var nome1: String = ""
    var nome2: String = ""
    
    @IBOutlet weak var fraseRandomizada: UILabel!
    
    @IBOutlet weak var minuteLabel: UILabel!
    
    @IBOutlet weak var secondLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    @IBAction func randomizarFraseButton(_ sender: Any) {
        randomizarFrase()
    }
    func randomizarFrase(){
        frase = Int.random(in: 0...3)
        fraseRandomizada.text = arrayDeFrases[frase]
    }

    

}
