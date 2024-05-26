//
//  Notification.swift
//  Tchê Conecta
//
//  Created by Yago Pereira on 26/5/24.
//

import Foundation

struct Notification: Identifiable {
    let id = UUID()
    let serviceName: String
    let location: String
    let status: String
    let sender: Person
}
