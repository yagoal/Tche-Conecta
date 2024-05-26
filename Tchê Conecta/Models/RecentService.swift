//
//  RecentService.swift
//  Tchê Conecta
//
//  Created by Yago Pereira on 26/5/24.
//

import Foundation

struct RecentService: Identifiable {
    let id = UUID()
    let date: String
    var services: [Service]
}

struct Service: Identifiable {
    let id = UUID()
    let name: String
    let priceOrTime: String
}
