//
//  EndGameViewController .swift
//  romance
//Balao1_v1_LS
//  Created by Eliza Maria Porto de Carvalho on 01/09/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import Foundation
import UIKit

class EndGameViewController: UIViewController {
    
    @IBAction func dismissDiscussion(_ sender: Any) {
       navigationController?.popToRootViewController(animated: true)
    }
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.navigationBar.isHidden = false
//    }
    
}
