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
    // MARK: Variáveis
    var randomTheme: Int = 0
    var name1: String?
    var name2: String?
    
     // MARK: Outlets
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var name1label: UILabel!
    @IBOutlet weak var name2label: UILabel!
    @IBOutlet weak var RecieveThemeLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        themeLabel.isHidden = true
        name1label.text = name1
        name2label.text = name2
        
    }
    
    @IBAction func randomizeTheme(_ sender: Any) {
        updadeTheme()
        themeLabel.isHidden = false
    }
    
    @IBAction func goNextViewButton(_ sender: Any) {
        self.performSegue(withIdentifier: "DisplayNameSegue", sender: self)
    }
    
    //Func to shake phone and receive a theme
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        updadeTheme()
        themeLabel.isHidden = false
        
        if themeLabel.isHidden == false {
            RecieveThemeLabel.isHidden = true
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DisplayNameSegue"{
            let displayVC = segue.destination as! TelaCronometroViewController
            displayVC.name1 = name1label.text
            displayVC.name2 = name2label.text
            
        }
    }
    func updadeTheme(){
        randomTheme = Int.random(in: 0 ... 5)
        themeLabel.text = arrayDeTemas_Dinamica03[randomTheme]
    }
    
}
