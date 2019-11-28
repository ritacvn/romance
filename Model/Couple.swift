
import Foundation


class Couple {
    var partnerOne: String
    var partnerTwo: String
    var partnerOneHidden: Bool
    var partnerTwoHidden: Bool
    
    init(partnerOne: String, partnerTwo: String) {
        self.partnerOne = partnerOne;
        self.partnerTwo = partnerTwo;
        self.partnerOneHidden = false;
        self.partnerTwoHidden = true;
    }
    
    func switchCouple() -> Void {
        self.partnerOneHidden = !self.partnerOneHidden;
        self.partnerTwoHidden = !self.partnerTwoHidden;
    }
    
    func partnerTurn() -> String {
        
        var partner = "";
        
        if(self.partnerOneHidden == false){
            partner = self.partnerOne;
        }
        
        if(self.partnerTwoHidden == false){
            partner = self.partnerTwo;
        }
        return partner;
    }
    
    
}
