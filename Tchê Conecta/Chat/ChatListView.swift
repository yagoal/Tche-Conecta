//
//  ChatView.swift
//  Tchê Conecta
//
//  Created by mateusdias on 25/05/24.
//

import SwiftUI

struct ChatListView: View {
    
    @EnvironmentObject var coordinator: AppCoordinator
    
    let professions: [Profession] = [
        Profession(id: 1, title: "Pedreiro", area: "Paredes e Estrutura"),
        Profession(id: 3, title: "Pedreiro", area: "Pisos em geral"),
        Profession(id: 8, title: "Manicure", area: "Serviços de Beleza"),    ]
    
    
    var persons: [Person] {
        [
            .init(id: 1, name: "José", profession: professions[0], image: Image("jose"), rank: 3),
            .init(id: 2, name: "Maria", profession: professions[1], image: Image("maria"), rank: 2),
            .init(id: 3, name: "Saulo", profession: professions[2], image: Image("saulo"), rank: 1),
           
        ]
    }
    
    
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                ForEach(persons) { person in
                    Divider()
                    ChatCell(person: person)
                        .onTapGesture {
                            coordinator.showChat(person: person, message: "Olá como vai ?")
                        }
                        
                }
            }
        }
        .navigationTitle("Minhas Conversas")
        
    }
}

#Preview {
    ChatListView()
}
