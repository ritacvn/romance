//
//  SliderTimeViewController.swift
//  romance
//
//  Created by Rita de Cássia Vasconcelos do Nascimento on 08/10/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import UIKit

class SliderTimeViewController: UIViewController {
    
    var sliderValue: Int = 0
    
    @IBOutlet weak var sliderTime: UISlider!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sliderTime.minimumValue = 0
        sliderTime.maximumValue = 3
    }
    
   
    @IBAction func sliderAction(_ sender: UISlider) {
        sliderValue = lround(Double(sender.value))
        timeLabel.text = "\(String(sliderValue)):00"
    }
    
    @IBAction func playNextView(_ sender: Any) {
        self.performSegue(withIdentifier: "sliderTime", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sliderTime"{
            let displayVC = segue.destination as! PlayScreenViewController
            let time = timeLabel.text
            displayVC.time = time
        }
    }
}
