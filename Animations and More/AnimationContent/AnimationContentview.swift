//
//  AnimationContentview.swift
//  Animations and More
//
//  Created by Jeffrey Klinkhamer on 19/06/2024.
//

import SwiftUI

struct AnimationContentview: View {
    @State private var showDetails = false
    @State private var opacity = 1.0
    @State private var isRotated = false
    @State private var isStarOn = false
    @State private var isStarBig = false
    @State private var isMoonOn = false
    @State private var isMoonBig = false
    private let foo: String = "foo"
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .padding()
                .scaleEffect(2.5)
                .rotationEffect(.degrees(isRotated ? 360 : 0))
                .onTapGesture {
                    withAnimation(.linear(duration: 1.5)) {
                        isRotated.toggle()
                    }
                }
            Button("Foo") {
                showDetails.toggle()
            }
                .padding()
            Text("Current visablity is: \(opacity)")
            Text("I am a test!")
                .opacity(showDetails ? 1.0 : 0.0)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.5).repeatForever()){
                        if(opacity == 0.0) {
                            opacity += 0.2
                        }
                        else {
                            opacity -= 0.2
                        }
                    }
                }
                .opacity(opacity)
                .padding()
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(isStarOn ? .yellow : .black)
                    .scaleEffect(isStarBig ? 2.5 : 1.0)
                    .onTapGesture {
                        isStarOn.toggle()
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.2)) {
                            isStarBig.toggle()
                        }
                    }
                    .padding()
                Image(systemName: "moon.fill")
                    .foregroundColor(isMoonOn ? .red : .yellow)
                    .scaleEffect(isMoonBig ? 2.5 : 1.0)
                    .onTapGesture {
                        isMoonOn.toggle()
                        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.2, blendDuration: 0.5)) {
                            isMoonBig.toggle()
                        }
                    }
                    .padding()
                Image(systemName: "globe")
            }
        }    }
}

struct AnimationContentview_Previews: PreviewProvider {
    static var previews: some View {
        AnimationContentview()
    }
}
