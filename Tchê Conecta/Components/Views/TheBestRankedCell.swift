//
//  TheBestRankedCell.swift
//  Tchê Conecta
//
//  Created by mateusdias on 26/05/24.
//

import SwiftUI

struct TheBestRankedCell: View {
    
    let persons: [Person]
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {

                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.menu)
                    .frame(width: geometry.size.width, height: geometry.size.height / 2)
                    .offset(y: geometry.size.height / 4)
                
 
                VStack {
                    Spacer()
                    VStack {
                        persons[0].image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.menu, lineWidth: 2))
                        
                        Text(persons[0].name)
                            .font(.headline)
                            .foregroundColor(.white)
                        HStack{
                            Image(systemName: "trophy.circle")
                                .foregroundStyle(.white)
                            Text("#1")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                    }
                    .frame(width: 100, height: 150)
                    .background(Color.blue)
                    .cornerRadius(20)
                    .offset(y: -geometry.size.height / 4)
                }

                VStack {
                    Spacer()
                    VStack {
                        persons[1].image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                        
                        Text(persons[1].name)
                            .font(.subheadline)
                            .foregroundColor(.black)
                        HStack {
                        Image(systemName: "trophy.circle")
                        Text("#2")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        }
                    }
                    .frame(width: 80, height: 120)
                    .background(Color.menu)
                    .cornerRadius(20)
                    .offset(x: -geometry.size.width / 3, y: -geometry.size.height / 6)
                }
                

                VStack {
                    Spacer()
                    VStack {
                        persons[2].image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                        
                        Text(persons[2].name)
                            .font(.subheadline)
                            .foregroundColor(.black)
                        HStack{
                        Image(systemName: "trophy.circle")
                        Text("#3")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        }
                    }
                    .frame(width: 80, height: 120)
                    .background(Color.menu)
                    .cornerRadius(20)
                    .offset(x: geometry.size.width / 3, y: -geometry.size.height / 6)
                }
            }
        }
        .frame(height: 120)
        .padding()
    }
}


//#Preview {
//    TheBestRankedCell()
//}
