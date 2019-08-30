//
//  ViewController.swift
//  romance
//
//  Created by Rita de Cássia Vasconcelos do Nascimento on 26/08/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var name1: UITextField!
    @IBOutlet weak var name2: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }

    @IBAction func goNextViewButton(_ sender: Any) {
        self.performSegue(withIdentifier: "InputNameToDisplay", sender: self)
        
    }
    // Parsing names to the other view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "InputNameToDisplay"{
            let displayVC = segue.destination as! Dinamica03ViewController
            displayVC.name1 = name1.text
            displayVC.name2 = name2.text
        }
    }

    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}

