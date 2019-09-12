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
    
    @IBOutlet weak var fraseRandomizada: UILabel!
    
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
