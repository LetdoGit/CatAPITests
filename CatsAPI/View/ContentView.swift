//
//  ContentView.swift
//  CatsAPI
//
//  Created by Letícia Victoria das Neves Sales on 30/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var catVM = CatViewModel()
    var body: some View {
        NavigationView{
            HStack {
                if catVM.isLoading {
                    LoadingView()
                } else if catVM.errorMessage != nil {
                    ErrorView()
                } else {
                    CatView(breeds: catVM.cats)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
