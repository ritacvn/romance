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
    var name1: String = ""
    var name2: String = ""
    
    // MARK: Outlets
    @IBOutlet weak var name1label: UILabel!
    @IBOutlet weak var name2label: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name1label.text = name1
        name2label.text = name2
        
        name2label.isHidden = true
        name1label.isHidden = true
    }
    
    //Shake to go next page
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        self.performSegue(withIdentifier: "DisplayNameSegue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let displayVC = segue.destination as! TelaCronometroViewController
            displayVC.finalName1 = name1label.text!
            displayVC.finalName2 = name2label.text!
    }
    
    
    //  @IBAction func randomizeTheme(_ sender: Any) {
    //     updadeTheme()
    //     themeLabel.isHidden = false
    //  }
    
    //  @IBAction func goNextViewButton(_ sender: Any) {
    //     self.performSegue(withIdentifier: "DisplayNameSegue", sender: self)
    //  }
    

}
