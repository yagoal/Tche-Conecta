//
//  Person.swift
//  Tchê Conecta
//
//  Created by mateusdias on 25/05/24.
//

import Foundation
import SwiftUI

struct Person: Identifiable {
    let id: Int
    let name: String
    let profession: Profession
    let image: Image
    let rank: Int
    
    var professionAndArea: String {
        return profession.title + " - " + profession.area
    }
}
