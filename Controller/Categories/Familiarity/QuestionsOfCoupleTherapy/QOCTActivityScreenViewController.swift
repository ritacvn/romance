//
//  QOCTActivityScreenViewController.swift
//  romance
//
//  Created by Eliza Maria Porto de Carvalho on 22/10/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import Foundation
import UIKit

class QOCTActivityScreenViewController: UIViewController{
    
    var theme: String = ""
    
    @IBOutlet weak var mainThemeOutlet: UILabel!
    
    override func viewDidLoad() {
        updadeTheme()
        mainThemeOutlet.text = "\(String(describing: theme))"
    }
    
    
    //Randomizing the theme
    func updadeTheme(){
        let randomTheme = Int.random(in: 0 ... 3)
        theme = arrayOfQuests_Act1F[randomTheme]
    }
       
}
