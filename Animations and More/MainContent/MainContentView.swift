//
//  MainContentView.swift
//  Animations and More
//
//  Created by Jeffrey Klinkhamer on 05/06/2024.
//

import SwiftUI

struct MainContentView: View {
    
    var body: some View {
        TabView {
            HomeScreenView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            AnimationContentview()
                .tabItem {
                    Label("Simple animations", systemImage: "list.dash")
                }
            WishListView()
                .tabItem {
                    Label("Wish list", systemImage: "star")
                }
        }
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
