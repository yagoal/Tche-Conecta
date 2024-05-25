//
//  SignupView.swift
//  Tchê Conecta
//
//  Created by Yago Pereira on 25/5/24.
//

import SwiftUI

import SwiftUI

import SwiftUI

struct SignupView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var searchText = ""
    @State private var selectedProfession: Profession?
    @EnvironmentObject var coordinator: AppCoordinator

    // Exemplo de lista de profissões
    let professions: [Profession] = [
        Profession(id: 1, title: "Pedreiro", area: "Paredes e Estrutura"),
        Profession(id: 2, title: "Pedreiro", area: "Instalação Portas e Janelas"),
        Profession(id: 3, title: "Pedreiro", area: "Pisos em geral"),
        Profession(id: 4, title: "Pedreiro", area: "Instalação Telhado e Telhas")
    ]
    
    var body: some View {
        VStack(spacing: 30) {

            VStack(alignment: .leading, spacing: 25) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Selecione sua habilidade")
                        .font(.system(size: 16, weight: .semibold, design: .default))
                        .foregroundColor(.black)
                    
                    SearchableDropdown(searchText: $searchText, placeholder: "Profissão", suggestions: professions, selectedProfession: $selectedProfession)
                        .zIndex(1)
                }

                CustomTextField(placeholder: "E-mail", text: $email)
                    .zIndex(0)
                CustomTextField(placeholder: "Usuário", text: $username)
                    .zIndex(0)
                CustomPasswordField(placeholder: "Senha", text: $password)
                    .zIndex(0)
                CustomPasswordField(placeholder: "Confirme sua senha", text: $confirmPassword)
                    .zIndex(0)

                Button(action: {
                }) {
                    HStack {
                        Spacer()
                        Text("Cadastrar")
                            .font(.system(size: 16, weight: .medium, design: .default))
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding()
                    .background(Color.black)
                    .cornerRadius(8)
                }

                Button(action: {
                    // Ação para o botão "Termos de Serviço e Política de Privacidade"
                }) {
                    Text("Ao clicar, você concorda com nossos Termos de Serviço e Política de Privacidade")
                        .font(.system(size: 14, design: .default))
                        .foregroundColor(.blue)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 8)
            }
            .padding(EdgeInsets(top: 0, leading: 24, bottom: 27, trailing: 24))
            .frame(width: 375, alignment: .leading)

            Spacer()
        }
        .navigationBarTitle("Cadastre-se", displayMode: .inline)
        .padding(.top, 50)
    }
}

#Preview {
    SignupView()
}
