//
//  ServicesCell.swift
//  Tchê Conecta
//
//  Created by mateusdias on 25/05/24.
//

import SwiftUI

struct ServicesCell: View {

    let person: Person

    var body: some View {
        VStack {
            person.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())

            Text(person.name).fontWeight(.semibold)
            
            Text(person.profession.title)
              .font(.system(size: 15))
              .tint(.gray)

            HStack {
                Image(systemName: "trophy.circle")
                Text("#\(person.rank)")
              .padding([.leading, .trailing, .bottom], 1)
              .font(.system(size: 17, weight: .bold))
              .tint(.gray)
            }
          }
    }
}

#Preview {
    ServicesCell(
        person: Person(
            id: 1,
            name: "Mateus",
            profession: .init(
                id: 1,
                title: "Develop",
                area: "iOS"
            ),
            image: Image("joão"),
            rank: 4
        )
    )
}
