//
//  SearchBar.swift
//  Tchê Conecta
//
//  Created by Yago Pereira on 25/5/24.
//

import SwiftUI

struct SearchableDropdown: View {
    @Binding var searchText: String
    var placeholder: String
    var suggestions: [Profession]
    @Binding var selectedProfession: Profession?
    
    @State private var isDropdownVisible = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField(placeholder, text: $searchText, onEditingChanged: { editing in
                    withAnimation {
                        isDropdownVisible = editing
                    }
                })
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                self.isDropdownVisible.toggle()
                            }
                        }) {
                            Image(systemName: isDropdownVisible ? "chevron.up" : "chevron.down")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.trailing, 8)
                )
            }
            .onTapGesture {
                withAnimation {
                    self.isDropdownVisible.toggle()
                }
            }

            if isDropdownVisible {
                VStack(alignment: .leading) {
                    ScrollView {
                        VStack(alignment: .leading) {
                            if filteredSuggestions.isEmpty {
                                Text("Nenhum resultado encontrado")
                                    .padding()
                                    .foregroundColor(.gray)
                                    .transition(.opacity)
                            } else {
                                ForEach(filteredSuggestions) { suggestion in
                                    Text("\(suggestion.title) - \(suggestion.area)")
                                        .padding()
                                        .background(Color(.systemGray6))
                                        .onTapGesture {
                                            withAnimation {
                                                self.selectedProfession = suggestion
                                                self.searchText = "\(suggestion.title) - \(suggestion.area)"
                                                self.isDropdownVisible = false
                                            }
                                        }
                                }
                            }
                        }
                        .padding(.vertical, 8)
                    }
                    .background(Color(.systemGray6))
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: 150)
                    .cornerRadius(8)
                    .shadow(radius: 5)
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .animation(.easeInOut(duration: 0.3))
                }
            }
        }
        .background(Color.white)
    }
    
    private var filteredSuggestions: [Profession] {
        if searchText.isEmpty {
            return suggestions.sorted(by: { $0.title < $1.title })
        } else {
            return suggestions
                .filter {
                    $0.title.lowercased().contains(searchText.lowercased()) ||
                    $0.area.lowercased().contains(searchText.lowercased())
                }
                .sorted(by: { $0.title < $1.title })
        }
    }
}
