//
//  InicialDinamica2ViewController.swift
//  romance
//
//  Created by Rita de Cássia Vasconcelos do Nascimento on 02/09/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import UIKit

class InicialDinamica2ViewController: UIViewController, UITextFieldDelegate {

    var name1: String = ""
    var name2: String = ""
    
    
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
            
            let message: String = "Sorry, you didin't fill all the fields"
            let alert = UIAlertController(title:title,message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok",style: .default, handler: nil)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
        }
        self.name1 = nome1text.text!
        self.name2 = nome2text.text!
        self.performSegue(withIdentifier: "SegueToTurnScreen", sender: self)
    
    }
    
    //Parsing names to the other view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SegueToTurnScreen"{
            let displayVC = segue.destination as! TurnViewController
            let couple = Couple(partnerOne: self.name1, partnerTwo: self.name2)
            displayVC.couple = couple
            displayVC.end = false
        }
        
    }
    
}

