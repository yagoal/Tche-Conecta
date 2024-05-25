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
    
    let professions: [Profession] = [
        Profession(id: 1, title: "Pedreiro", area: "Paredes e Estrutura"),
        Profession(id: 2, title: "Pedreiro", area: "Instalação Portas e Janelas"),
        Profession(id: 3, title: "Pedreiro", area: "Pisos em geral"),
        Profession(id: 4, title: "Pedreiro", area: "Instalação Telhado e Telhas"),
        Profession(id: 5, title: "Eletricista", area: "Sistemas prediais"),
        Profession(id: 6, title: "Eletricista", area: "Sistemas industriais"),
        Profession(id: 7, title: "Cabeleireira", area: "Serviços de Beleza"),
        Profession(id: 8, title: "Manicure", area: "Serviços de Beleza"),
        Profession(id: 9, title: "D. Gráfico", area: "Design e Comunicação"),
    ]

    var persons: [Person] {
        [
            .init(id: 1, name: "José", profession: professions[0], image: Image("jose"), rank: 3),
            .init(id: 2, name: "Maria", profession: professions[7], image: Image("maria"), rank: 2),
            .init(id: 3, name: "Saulo", profession: professions[2], image: Image("saulo"), rank: 1),
            .init(id: 4, name: "Cristiana", profession: professions[6], image: Image("cristiana"), rank: 4),
            .init(id: 5, name: "Everton", profession: professions[5], image: Image("everton"), rank: 5),
            .init(id: 6, name: "Ana", profession: professions[8], image: Image("ana"), rank: 6),
        ]
    }

    private let adaptiveComlumns = [
        GridItem(.adaptive(minimum: 100))
    ]

    var filteredPersons: [Person] {
        let personsRank = persons.sorted(by: {$0.rank < $1.rank})
        guard  !searchText.isEmpty else {return personsRank}
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
            
            Text("Prestadores de Serviço")
                .font(.system(size: 17, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.black)
            
            Text("Selecione")
                .font(.system(size: 15))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.gray)

            ScrollView{
                LazyVGrid(columns: adaptiveComlumns, spacing: 20) {
                    ForEach(filteredPersons) { person in
                        ZStack{
                            ServicesCell(person: person)
                                .onTapGesture {
                                    coordinator.showRequestServicesDetails(person: person)
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
