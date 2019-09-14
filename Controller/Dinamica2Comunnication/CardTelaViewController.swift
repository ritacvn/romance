//
//  CardTelaViewController.swift
//  romance
//
//  Created by Rita de Cássia Vasconcelos do Nascimento on 02/09/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import UIKit

class CardTelaViewController: UIViewController {
    
    var isopen = false
    var palavra: Int = 0
    var imagem: Int = 0
    @IBOutlet weak var cardFlip: UIView!
    @IBOutlet weak var labelPalavra: UILabel!
    
    @IBOutlet weak var labelGenerica: UILabel!
   
    @IBOutlet weak var cardImage: UIImageView!
        override func viewDidLoad() {
            super.viewDidLoad()
                //labelPalavra.isHidden = true
                // labelGenerica.isHidden = true
                // Do any additional setup after loading the view.
        }
    

    @IBAction func flipButton(_ sender: Any) {
            if isopen == false{
                isopen = true
                updateImage()
                UIView.transition(with: cardImage, duration: 0.6, options: .transitionFlipFromRight, animations: nil, completion: nil)
            }
        }
    
    @IBAction func FinishButton(_ sender: Any) {
        
        //performSegue(withIdentifier: <#T##String#>, sender: Any)
        
    }
    
    
//    @IBAction func showPalavra(_ sender: Any) {
//        updateImage()
//    }
    
    

    func updateImage(){
        imagem = Int.random(in: 0 ... 1)
        cardImage.image = arrayImagens[imagem]
    }
}
