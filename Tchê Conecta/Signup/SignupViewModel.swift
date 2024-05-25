//
//  SignupViewModel.swift
//  Tchê Conecta
//
//  Created by Yago Pereira on 25/5/24.
//

import SwiftUI
import Combine

class SignupViewModel: ObservableObject {
    @Published var email = ""
    @Published var username = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var searchText = ""
    @Published var selectedProfession: Profession?
    @Published var isLoading = false
    @Published var showAlert = false

    let professions: [Profession] = [
        Profession(id: 1, title: "Pedreiro", area: "Paredes e Estrutura"),
        Profession(id: 2, title: "Pedreiro", area: "Instalação Portas e Janelas"),
        Profession(id: 3, title: "Pedreiro", area: "Pisos em geral"),
        Profession(id: 4, title: "Pedreiro", area: "Instalação Telhado e Telhas")
    ]

    func register() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isLoading = false
            self.showAlert = true
        }
    }
}
