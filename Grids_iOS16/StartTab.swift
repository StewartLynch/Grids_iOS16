//
//  StartTab.swift
//  Grids_iOS16
//
//  Created by Stewart Lynch on 2022-08-10.
//

import SwiftUI

struct StartTab: View {
    var body: some View {
        TabView {
            Introduction()
                .tabItem {
                    Label("Introduction", systemImage: "1.circle.fill")
                    
                }
            TextGrids()
                .tabItem {
                    Label("Text Grids", systemImage: "2.circle.fill")
                    
                }
        }
    }
}

struct StartTab_Previews: PreviewProvider {
    static var previews: some View {
        StartTab()
    }
}
