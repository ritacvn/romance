//
//  ViewController.swift
//  romance
//
//  Created by Rita de Cássia Vasconcelos do Nascimento on 26/08/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    public var name1var: String?
    public var name2var: String?
    
    @IBOutlet weak var name1: UITextField!
    
    @IBOutlet weak var name2: UITextField!
    
    @IBOutlet weak var nomelabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       showNames()
    }
    func showNames(){
        name1var = name1.text
        name2var = name2.text
    }
   
}

