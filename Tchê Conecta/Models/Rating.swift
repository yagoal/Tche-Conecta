//
//  Rating.swift
//  Tchê Conecta
//
//  Created by Yago Pereira on 25/5/24.
//

import Foundation

struct Rating: Identifiable {
    let id = UUID()
    let icon: String
    let value: String
    let description: String
}
