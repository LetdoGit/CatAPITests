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
            Text(cat.name)
        }
        
    }
}

