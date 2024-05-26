//
//  ChatCell.swift
//  Tchê Conecta
//
//  Created by mateusdias on 25/05/24.
//

import SwiftUI

struct ChatCell: View {
    
    var person: Person
    
    var body: some View {
        HStack {
            person.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            VStack{
                Text(person.name).fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Olá como vai ?")
                    .font(.system(size: 15))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(.gray)
                
            }
        }
        .padding(10)
    }
}


#Preview {
    ChatCell(person: Person(id: 1, name: "Rodrigo", profession: Profession(id: 1, title: "Professor", area: "Historia"), image: Image("profile"), rank: 1))
}
