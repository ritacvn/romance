//
//  Categorias.swift
//  romance
//
//  Created by Rita de Cássia Vasconcelos do Nascimento on 11/09/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import UIKit

struct Categoria {
    let nome : String?
    let descricao: String?
    let image: String?
    
    static func fetchCategories() -> [Categoria]{
        let comunicacao = Categoria(nome: "Comunicação", descricao: "ação de transmitir uma mensagem e, eventualmente, receber outra mensagem como resposta", image: "ComunnicationBackground1.0")
        
//        let conhecimento = Categoria(nome: "Conhecimento", descricao: "Conhecimento é o ato ou efeito de conhecer, é ter ideia ou a noção de alguma coisa. É o saber, a instrução e a informação.", image: "FINALCard_Communication")
        
       // let carinho = Categoria(nome: "Carinho", descricao: "manifestação delicada, que pode ou não envolver contato físico, de apreço, amor ou meiguice", image: "carinho")
        
        let empatia = Categoria(nome: "Empatia", descricao: "processo de identificação em que o indivíduo se coloca no lugar do outro e, com base em suas próprias suposições ou impressões, tenta compreender o comportamento do outro.", image: "FamiliarityBackground1.0")
        
        return [comunicacao, empatia,]
    }
}
