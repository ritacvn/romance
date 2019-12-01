//
//  ComunicaoTelaViewController.swift
//  romance
//
//  Created by Rita de Cássia Vasconcelos do Nascimento on 13/09/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import UIKit

class ComunicaoTelaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
   
    @IBOutlet weak var tableView: UITableView!

    
    var activities: [Activities] = Activities.fetchActivitiesCommunication()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
       
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  activities.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "activities", for: indexPath) as! ActivitiesCommunicationTableViewCell
        let activity = activities[indexPath.row]
        
        cell.activity = activities[indexPath.row]
        cell.selectionStyle = .none
        self.tableView.rowHeight = 70
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let vc = self.storyboard?.instantiateViewController(identifier: "timedDiscussion") as! TimedDiscussionViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if indexPath.row == 1{
            let vc = self.storyboard?.instantiateViewController(identifier: "funnySpeech") as! FunnySpeachViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if indexPath.row == 2{
            let vc = self.storyboard?.instantiateViewController(identifier: "sentences") as! SentencesActivityViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
   

}
