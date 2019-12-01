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
    var palavra: Int = 0
    var imagem: Int = 0
    var end: Bool?
    
    
//    let name1 = UserDefaults.standard.string(forKey: "initialName01")
//    let name2 = UserDefaults.standard.string(forKey: "initialName02")
    
    //Importando classes
    var couple: Couple?
   
    @IBOutlet weak var cardFlip: UIView!
    @IBOutlet weak var labelPalavra: UILabel!
    @IBOutlet weak var labelGenerica: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    
    @IBOutlet weak var finishButtonOutlet: UIButton!
    @IBOutlet weak var nextButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if end! {
            nextButtonOutlet.isHidden = true
            finishButtonOutlet.isHidden = false
        }else{
            nextButtonOutlet.isHidden = false
            finishButtonOutlet.isHidden = true
        }
            
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
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "backToTurnVC"{
            let displayVC = segue.destination as! TurnViewController
            couple?.switchCouple()
            displayVC.couple = self.couple
            displayVC.end = !self.end!
        }
        
    }
    
   
    @IBAction func nextButton(_ sender: UIButton) {
        UIFeedback.hapticFeedback()
        performSegue(withIdentifier: "backToTurnVC", sender: self)
    }
    
    
    @IBAction func finishButton(_ sender: UIButton) {
        performSegue(withIdentifier: "goToEndVCSegue", sender: self)
        UIFeedback.hapticFeedback()
    }
    
    
    
    
}

