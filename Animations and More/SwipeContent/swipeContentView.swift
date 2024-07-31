//
//  swipeContentView.swift
//  Animations and More
//
//  Created by Jeffrey Klinkhamer on 17/07/2024.
//

import SwiftUI

struct swipeContentView: View {
    
    @State private var swipeUp = false
    @State private var swipeSide = false
    @State private var circlePosX = 150.0
    @State private var circlePosY = 500.0
    
    @State private var swipeDirection = ""
    
    @State private var offset = CGSize.zero
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(.green)
                    .frame(width: 200, height: 200, alignment: .center)
                Circle()
                    .fill(.red)
                    .frame(width: 100, height: 100, alignment: .center)
                    .position(x: circlePosX, y: circlePosY)
                    .gesture(
                        DragGesture(minimumDistance: 10, coordinateSpace: .local)
                            .onEnded { value in
                                let verticalMovement = value.translation.height
                                let horizontalMovement = value.translation.width
                                if verticalMovement < 0 {
                                    swipeUp = true
                                    self.swipeDirection = "up"
                                    withAnimation(.linear(duration: 1.0)) {
                                        circlePosY -= 50.0
                                    }
                                }
                                if verticalMovement > 0 {
                                    swipeUp = true
                                    self.swipeDirection = "down"
                                    withAnimation(.linear(duration: 1.0)) {
                                        circlePosY += 50.0
                                    }
                                }
                                if horizontalMovement < 0 {
                                    swipeSide = true
                                    self.swipeDirection = "left"
                                    withAnimation(.linear(duration: 1.0)) {
                                        circlePosX -= 50.0
                                    }
                                }
                                if horizontalMovement > 0 {
                                    swipeSide = true
                                    self.swipeDirection = "right"
                                    withAnimation(.linear(duration: 1.0)) {
                                        circlePosX += 50.0
                                    }
                                }
                            }
                    )
            }
            Text(swipeUp ? "Swipe \(swipeDirection) detected" : "no swipe detected")
        }
    }
}

struct swipeContentView_Previews: PreviewProvider {
    static var previews: some View {
        swipeContentView()
    }
}
