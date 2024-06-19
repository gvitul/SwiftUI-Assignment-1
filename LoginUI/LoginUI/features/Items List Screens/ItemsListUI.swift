//
//  ItemsListUi.swift
//  LoginUI
//
//  Created by Vitul Goyal on 19/06/24.
//

import SwiftUI

struct ItemListView: View {
    let items = Array(0...20);
    
    var body: some View {
        NavigationView {
            List(items, id: \.self) { item in
                NavigationLink(destination: ItemDetailView(item: "Item \(item.description)")) {
                    Text("Item \(item.description)")
                }
            }
            .navigationTitle("Items")
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView()
    }
}
