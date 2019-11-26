//
//  ActivitiesCommunicationTableViewCell.swift
//  romance
//
//  Created by Rita de Cássia Vasconcelos do Nascimento on 26/11/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import UIKit

class ActivitiesCommunicationTableViewCell: UITableViewCell {

     var activity: Activities!{
           didSet{
               updateUI()
           }
       }
    @IBOutlet weak var activityImage: UIImageView!
    func updateUI(){
           activityImage.layer.cornerRadius = 3
           activityImage.image = UIImage(named: activity.image!)
       }

}
