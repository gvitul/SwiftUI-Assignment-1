//
//  ItemDetailsUI.swift
//  LoginUI
//
//  Created by Vitul Goyal on 19/06/24.
//

import SwiftUI

import SwiftUI

struct ItemDetailView: View {
    var item: String
    
    var body: some View {
        VStack {
            Text(item)
                .font(.largeTitle)
                .padding()
            
            Spacer()
        }
        .navigationTitle(item)
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: "Item 1")
    }
}

