//
//  DinamicaViewController.swift
//  romance
//
//  Created by Eliza Maria Porto de Carvalho on 28/08/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import Foundation
import UIKit

class Dinamica03ViewController: UIViewController {
    
    var randomTheme: Int = 0
    
    
    @IBOutlet weak var themeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updadeTheme()
    }
    
    @IBAction func randomizeTheme(_ sender: Any) {
        updadeTheme()
    }
    
    func updadeTheme(){
       
        randomTheme = Int.random(in: 0 ... 5)
        
        themeLabel.text = arrayDeTemas_Dinamica03[randomTheme]
        
    }
    
}
