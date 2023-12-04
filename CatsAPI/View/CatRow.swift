//
//  CatRow.swift
//  CatsAPI
//
//  Created by Letícia Victoria das Neves Sales on 30/11/23.
//

import Foundation
import SwiftUI

struct CatRow: View {
    
    let cat: CatBreed
    let imageSize: CGFloat = 100
    
    var body: some View {
        
        HStack {
//            ForEach(cat){ breed in
                Text(cat.name)
//            }
//            if let cat = cat.url {
//                AsyncImage(url: cat){ phase in
//                    switch phase {
//                    case .empty:
//                        Text("Loading")
//                    case .success(let image):
//                        image
//                            .resizable()
//                            .frame(width: imageSize, height: imageSize)
//                    case .failure(let error):
//                        Text("failure")
//                    default:
//                        EmptyView()
//                    }
//                }
//            } else {}

        }

    }
}

