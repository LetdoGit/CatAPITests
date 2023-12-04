//
//  CatView.swift
//  CatsAPI
//
//  Created by Letícia Victoria das Neves Sales on 04/12/23.
//

import Foundation
import SwiftUI

struct CatView: View {
    @ObservedObject var viewModel = CatViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List(filteredCats) { cat in
                    HStack{
                        CatImageView(cat: cat)
                        CatTextView(cats: cat.breeds)
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .searchable(text: $searchText)
            }
            .navigationTitle("Cats")
        }
        .onAppear {
            viewModel.fetchCats()
        }
    }
    
    var filteredCats: [CatImage] {
        if searchText.isEmpty {
            return viewModel.cats.filter { !$0.breeds.isEmpty }
        } else {
            return viewModel.cats.filter { cat in
                !cat.breeds.isEmpty &&
                cat.breeds.contains(where: { $0.name.localizedCaseInsensitiveContains(searchText) })
            }
        }
    }
}

#Preview {
    CatView()
}

