//
//  CardTela2ViewController.swift
//  romance
//
//  Created by Rita de Cássia Vasconcelos do Nascimento on 02/09/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import UIKit

class CardTela2ViewController: UIViewController {

    var isopen = false
    var palavra: Int = 0
    @IBOutlet weak var cardFlip: UIView!
    @IBOutlet weak var labelPalavra: UILabel!
    
    @IBOutlet weak var labelGenerica: UILabel!
    @IBOutlet weak var btnCard: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        labelPalavra.isHidden = true
        labelGenerica.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func flipButton(_ sender: Any) {
        // Animação das cartas (FlipCard)
        
        if isopen{
            isopen = false
            let image = UIImage(named: "cardtrue")
            btnCard.setImage(image, for: .normal)
            UIView.transition(with: cardFlip, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
            labelPalavra.text = "  "
            
            
        }else{
            isopen = true
            labelGenerica.isHidden = false
            labelPalavra.isHidden = false
            let image = UIImage(named: "cardtrue")
            btnCard.setImage(image, for: .normal)
            UIView.transition(with: cardFlip, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
        
    }
    
    @IBAction func showPalavra(_ sender: Any) {
        updadeWord()
    }
    func updadeWord(){
        palavra = Int.random(in: 0 ... 4)
        labelPalavra.text = arrayPalavrasDinamica02[palavra]
    }

}
