//
//  EditNamesViewController.swift
//  romance
//
//  Created by Rita de Cássia Vasconcelos do Nascimento on 16/10/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import UIKit
import CoreData

class EditNamesViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var name1textfield: UITextField!
    @IBOutlet weak var name2textfield: UITextField!
    @IBOutlet weak var name1Label: UILabel!
    @IBOutlet weak var name2Label: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.name1textfield.delegate = self
        self.name2textfield.delegate = self
        name2Label.isHidden = true
        name1Label.isHidden = true
       
    }
    

    @IBAction func saveNamesButton(_ sender: Any) {
        if (name1textfield.text?.count)! > 0 && (name2textfield.text?.count)! > 0  {
            UserDefaults.standard.set(name1textfield.text, forKey: "name1")
            UserDefaults.standard.set(name2textfield.text, forKey: "name2")
            name1textfield.isHidden = true
            name2textfield.isHidden = true
            name2Label.isHidden = false
            name1Label.isHidden = false
            let name1 = UserDefaults.standard.string(forKey: "name1")
            let name2 = UserDefaults.standard.string(forKey: "name2")
            name1Label.text = name1
            name2Label.text = name2
        }

    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        name1textfield.resignFirstResponder()
        name2textfield.resignFirstResponder()
        
        return true
    }
}
