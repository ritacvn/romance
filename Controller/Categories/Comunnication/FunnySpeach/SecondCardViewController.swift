//
//  CardTelaViewController.swift
//  romance
//
//  Created by Rita de Cássia Vasconcelos do Nascimento on 02/09/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import UIKit



class SecondCardTelaViewController: UIViewController {

    var isopen = false
    var imagem: Int = 0
  
    //Importando classes
    var couple: Couple?
   
    @IBOutlet weak var cardFlip: UIView!
    @IBOutlet weak var cardImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func flipButton(_ sender: Any) {
            if isopen == false{
                isopen = true
                updateImage()
                UIView.transition(with: cardImage, duration: 0.6, options: .transitionFlipFromRight, animations: nil, completion: nil)
            }
        
        UIFeedback.hapticFeedback()
    }
    
    @IBAction func showPalavra(_ sender: Any) {
        updateImage()
    }
    
    func updateImage(){
        imagem = Int.random(in: 0 ... 4)
        cardImage.image = arrayImagens[imagem]
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        UIFeedback.hapticFeedback()
        performSegue(withIdentifier: "finalFunnySpeechSegue", sender: self)
    }
    

}

