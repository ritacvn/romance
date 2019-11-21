//
//  Couple.swift
//  romance
//
//  Created by Eliza Maria Porto de Carvalho on 14/09/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import Foundation


class Couple {
    
    let partnerOne = UserDefaults.standard.string(forKey: "initialName01")
    let partnerTwo = UserDefaults.standard.string(forKey: "initialName02")
    var partnerOneHidden: Bool
    var partnerTwoHidden: Bool
    //var partnerNumb = 0
    
    init(partnerOne: String, partnerTwo: String, partnerNumb: Int) {
        self.partnerOneHidden = false;
        self.partnerTwoHidden = true;
       // self.partnerNumb = 0
    }
    
    func switchCouple() -> Void {
        self.partnerOneHidden = !self.partnerOneHidden;
        self.partnerTwoHidden = !self.partnerTwoHidden;
    }
    
    func partnerTurn() -> Int {
        
        var partnerNumb: Int = 1
        
        
        if(self.partnerOneHidden == false){
//            partner = partnerOne!;
            partnerNumb = 1
        }
        
        if(self.partnerTwoHidden == false){
//           partner = partnerTwo!;
            partnerNumb = 2
        }
        
        return partnerNumb
    }
    
    
}
