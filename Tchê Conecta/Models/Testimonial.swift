//
//  Testimonial.swift
//  Tchê Conecta
//
//  Created by Yago Pereira on 25/5/24.
//

import Foundation

struct Testimonial: Identifiable {
    let id = UUID()
    let name: String
    let daysAgo: Int
    let rating: Double
    let comment: String
}
