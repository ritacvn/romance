//
//  InicialDinamica2ViewController.swift
//  romance
//
//  Created by Rita de Cássia Vasconcelos do Nascimento on 02/09/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import UIKit

class InicialDinamica2ViewController: UIViewController, UITextFieldDelegate {

    var initialName01: String = ""
    var initialName02: String = ""
    var counter = 0
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var nome1text: UITextField!
    @IBOutlet weak var nome2text: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        self.nome1text.delegate = self
        self.nome2text.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func nextButton(_ sender: Any) {
        
        if nome1text.text == "" || nome2text.text == ""{
            
            let message: String = "You didin't fill all the fields"
            let alert = UIAlertController(title:title,message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok",style: .default, handler: nil)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
            
        }else if (nome1text.text?.count)! > 0 && (nome1text.text?.count)! > 0  {
                  
            UserDefaults.standard.set(nome1text.text, forKey: "initialName01")
            UserDefaults.standard.set(nome2text.text, forKey: "initialName02")
        
        }
        
        //Saving Names
//        self.initialName01 = nome1text.text!
//        self.initialName02 = nome2text.text!

        UserDefaults().set(true, forKey: "first")
        
    }

    
}

