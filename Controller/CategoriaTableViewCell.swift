//
//  VideoTableViewCell.swift
//  romance
//
//  Created by Rita de Cássia Vasconcelos do Nascimento on 11/09/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import UIKit

class CategoriaTableViewCell: UITableViewCell{
    
    @IBOutlet weak var categoriaImage: UIImageView!
    
    @IBOutlet weak var categoryName: UILabel!
    
    var categoria: Categoria!{
        didSet{
            updateUI()
        }
    }
    func updateUI(){
        categoriaImage.image = UIImage(named: categoria.image!)
        categoryName.text = categoria.nome
    }
}
