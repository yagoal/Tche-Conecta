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
    @Published var document = ""
    @Published var confirmPassword = ""
    @Published var searchText = ""
    @Published var selectedProfession: Profession?
    @Published var isLoading = false
    @Published var showAlert = false

    func register() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isLoading = false
            self.showAlert = true
        }
    }
}
