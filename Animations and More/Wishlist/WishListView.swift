//
//  WishListView.swift
//  Animations and More
//
//  Created by Jeffrey Klinkhamer on 19/06/2024.
//

import SwiftUI

struct WishListView: View {
    var body: some View {
        List {
            Text("Make a exciting homescreen!")
            Text("Maybe do something with Spline!")
            Text("Spring animation(s)")
            Text("movement animation")
            Text("Swipe up and down")
            Text("Collision detection?")
        }
    }
}

struct WishListView_Previews: PreviewProvider {
    static var previews: some View {
        WishListView()
    }
}
