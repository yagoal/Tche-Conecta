//
//  Person.swift
//  Tchê Conecta
//
//  Created by mateusdias on 25/05/24.
//

import Foundation


struct Person:  Identifiable {
    let id: Int
    let name: String
    let profession: String
    let area: String
    let image: String
    let rank: Int
    
    var professionAndArea: String {
        return profession + " - " + area
    }
}
