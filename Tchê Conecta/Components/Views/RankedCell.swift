//
//  RankedCell.swift
//  Tchê Conecta
//
//  Created by mateusdias on 26/05/24.
//

import SwiftUI

struct RankedCell: View {
        
    let persons: Person
    let color: Color
    
    var body: some View {
        HStack {
            HStack{
                persons.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text(persons.name)
                    .font(.system(size: 16, weight: .semibold))
            }.frame(maxWidth: .infinity, alignment: .leading)
            HStack{
                Image(systemName: "trophy.circle")
                Text("#\(persons.rank)")
                    .padding([.leading, .trailing, .bottom], 1)
                    .font(.system(size: 17, weight: .bold))
                    .tint(.gray)
            }.frame(alignment: .trailing)
            
        }
        .padding()
        .background(color)
        .cornerRadius(8)
        
    }
}
//
//#Preview {
//    RankedCell()
//}
