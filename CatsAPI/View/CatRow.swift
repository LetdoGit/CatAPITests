//
//  CatRow.swift
//  CatsAPI
//
//  Created by Letícia Victoria das Neves Sales on 30/11/23.
//

import Foundation
import SwiftUI

struct CatImageView: View {
    
    let cat: CatImage
    let imageSize: CGFloat = 100
    
    var body: some View {
        AsyncImage(url: cat.url) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .cornerRadius(10)
        } placeholder: {
            ProgressView()
        }
        
    }
    
}

struct CatTextView: View {
  
    let cats: [CatBreed]
   
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(cats) { cat in
                Text(cat.name)
                    .font(.headline)
                    .padding(.top, 8)
            }
        }
   
    }
}

