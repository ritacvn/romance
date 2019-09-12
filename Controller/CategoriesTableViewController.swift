//
//  CategoriesViewController.swift
//  romance
//
//  Created by Rita de Cássia Vasconcelos do Nascimento on 11/09/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import UIKit

class CategoriesTableViewcontroller: UITableViewController{
    var categories: [Categoria] = Categoria.fetchCategories()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoriaTableViewCell
        let categoria = categories[indexPath.row]
        
        cell.categoria = categoria
        return cell
    }
}