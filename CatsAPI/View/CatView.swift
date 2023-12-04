//
//  BreedView.swift
//  CatsAPI
//
//  Created by Letícia Victoria das Neves Sales on 30/11/23.
//

import SwiftUI

struct CatView: View {
    
    @State private var searchText: String = ""
    let breeds: [CatBreed]
    
    var filteredBreeds: [CatBreed] {
        if searchText.count == 0 {
            return breeds
        } else {
            return breeds.filter { $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
            
        ZStack{
                List {
                    ForEach(filteredBreeds) { cat in
                        CatRow(cat: cat)
                    }
                    .listStyle(PlainListStyle())
                    .searchable(text: $searchText)
                    
                }
                .navigationTitle("Cats")
            }
        }

}

#Preview {
    EmptyView()
}

