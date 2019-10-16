//
//  CategoriesViewController.swift
//  romance
//
//  Created by Rita de Cássia Vasconcelos do Nascimento on 11/09/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import UIKit


class CategoriesTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var categories: [Categoria] = Categoria.fetchCategories()

    
    override func viewDidLoad() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension CategoriesTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCellId", for: indexPath) as! CategoriaTableViewCell
        
        let categoria = categories[indexPath.row]
        
        cell.categoria = categoria
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if indexPath.row == 0{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "comunicacao") as! ComunicaoTelaViewController
            self.present(vc, animated: true, completion: nil)
        }
        if indexPath.row == 1{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "conhecimento") as! FamiliarityViewController
                       self.present(vc, animated: true, completion: nil)
        }
        else{
            
            let message: String = "Sorry, but this category is not available yet "
            let alert = UIAlertController(title:title,message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok",style: .default, handler: nil)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
        }
        
    }

    
}
