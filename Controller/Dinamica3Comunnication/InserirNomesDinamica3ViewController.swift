//
//  InserirNomesDinamica3ViewController.swift
//  romance
//
//  Created by Rita de Cássia Vasconcelos do Nascimento on 13/09/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import UIKit

class InserirNomesDinamica3ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nome1TextField: UITextField!
    
    @IBOutlet weak var nome2TextField: UITextField!
    
    var namePerson1: String = ""
    var namePerson2: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
//        Uncomment the line below if you want the tap not not interfere and cancel other interactions.
//        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
        self.nome1TextField.delegate = self
        self.nome2TextField.delegate = self
      
    }
    
    @IBAction func buttonNextView(_ sender: Any) {
        if nome1TextField.text == "" || nome2TextField.text == ""{
            
            let message: String = "Desculpe, você não preencheu todos os campos"
            let alert = UIAlertController(title:title,message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok",style: .default, handler: nil)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
        }
        self.namePerson1 = nome1TextField.text!
        self.namePerson2 = nome2TextField.text!
        self.performSegue(withIdentifier: "goNextView", sender: self)
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nome2TextField.resignFirstResponder()
        nome1TextField.resignFirstResponder()
        
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let displayVC = segue.destination as! FrasesRandomicaViewController
        displayVC.nome1 = self.namePerson1
        displayVC.nome2 = self.namePerson2
    }
    
}
