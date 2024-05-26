//
//  RankView.swift
//  Tchê Conecta
//
//  Created by mateusdias on 26/05/24.
//

import SwiftUI

struct RankView: View {
    
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
            .init(id: 7, name: "Você", profession: professions[6], image: Image("profile"), rank: 7),
        ]
    }

    var personsRanking: [Person] {
        let personsRank = persons.sorted(by: {$0.rank < $1.rank})
        return personsRank
    }
    
    var personsRank: [Person] {
        let personsRank = persons.sorted(by: {$0.rank < $1.rank})
        let persons = personsRank.filter({ $0.rank > 3 })
        return persons
    }
    
    var body: some View {
        VStack(spacing: 40) {
            HStack(spacing: 20) {
                
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 75, height: 75, alignment: .leading)
                    .clipShape(Circle())
                
                Text("Fernanda Anjos Rosario")
                    .font(.system(size: 16, weight: .semibold))
      
            }
            
            VStack{
                HStack{
                    Image(systemName: "trophy.circle")
                    Text("Classificação")
                        .font(.system(size: 17, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.black)
                }
                HStack(spacing: 50){
                    TheBestRankedCell(persons: personsRanking)
                }
            }
       
            ScrollView {
                ForEach(personsRank) { person in
                    
                    let rankSelected: Color = person.name == "Você" ? .menu : .clear
                    
                    RankedCell(persons: person, color: rankSelected)
                }
            }
            
        }
        .padding(15)
        .navigationTitle("Ranking")
    }
    
}

#Preview {
    RankView()
}
