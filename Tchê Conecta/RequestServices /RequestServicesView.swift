//
//  RequestServices.swift
//  Tchê Conecta
//
//  Created by mateusdias on 25/05/24.
//

import SwiftUI
import Foundation

struct RequestServicesView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @State private var selectedProfession: Profession?
    @State private var searchText = ""

    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 100))
    ]

    var filteredPersons: [Person] {
        let personsRank = persons.sorted(by: {$0.rank < $1.rank})
        guard  !searchText.isEmpty else { return personsRank }
        return personsRank.filter{
            $0.profession.title.localizedCaseInsensitiveContains(searchText) ||
            $0.profession.area.localizedCaseInsensitiveContains(searchText)  ||
            $0.name.localizedCaseInsensitiveContains(searchText)  ||
            $0.professionAndArea.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Selecione o tipo de profissional:")
                .font(.system(size: 17, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.black)
            SearchableDropdown(searchText: $searchText, placeholder: "Profissão", suggestions: professions, selectedProfession: $selectedProfession)
                .zIndex(1)
            
            Text("Prestadores de Serviço: ")
                .font(.system(size: 17, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.black)
            if !filteredPersons.isEmpty {
                Text("Selecione")
                    .font(.system(size: 15))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(.gray)
            }

            ScrollView {
                if filteredPersons.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "exclamationmark.triangle")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)
                        Text("Nenhum resultado encontrado")
                            .font(.system(size: 17))
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 50)
                } else {
                    LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                        ForEach(filteredPersons) { person in
                            ZStack {
                                ServicesCell(person: person)
                                    .onTapGesture {
                                        coordinator.showRequestServicesDetails(person: person)
                                    }
                            }
                        }
                    }
                }
            }
        }
        .padding(20)
        .navigationTitle("Solicitar Serviço")
    }
}

#Preview {
    RequestServicesView()
}
