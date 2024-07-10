//
//  HomeScreenView.swift
//  Animations and More
//
//  Created by Jeffrey Klinkhamer on 19/06/2024.
//

import SwiftUI

struct HomeScreenView: View {
    @State private var starRotation: Double = 0.0
    @State private var walkPath: Bool = false
    
    @State private var progress: CGFloat = .zero
    
    var body: some View {
        VStack {
            Text("Welcome to this freakshow")
                .padding()
            // silly image to set a baseline
            Image(systemName: "star.fill")
                .onAppear {
                    withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                        starRotation += 360.0
                    }
                }
                .rotationEffect(.degrees(starRotation))
            // some wierd path animation because idk what to do now
            Path { path in
                  path.move(to: CGPoint(x: 10, y: 50))
                  path.addLine(to: CGPoint(x: 30, y: 80))
                if walkPath {
                        path.addLine(to: CGPoint(x: 70, y: 20))
                      }
                }
            .stroke(Color.green, lineWidth: 15.0)
            .scaleEffect(walkPath ? 1 : 0, anchor: .top)
            .onAppear {
                withAnimation(.linear(duration: 1.5).repeatCount(20)) {
                    walkPath.toggle()
                }
            }
            .frame(width: 50.0, height: 50.0, alignment: .center)
            Path { path in
                  path.move(to: CGPoint(x: 0, y: 50))
                  path.addLine(to: CGPoint(x: 150, y: 50))
                }
            .trim(from: .zero, to: progress)
            .stroke(Color.red, lineWidth: 5)
            .onAppear {
                withAnimation(.easeInOut(duration: 5.5).repeatForever(autoreverses: true)) {
                    self.progress = 1.0
                }
            }
            ZStack {
                Circle()
                    .stroke(Color.red, lineWidth: 5)
                    .frame(width: 80, height: 80, alignment: .center)
                Circle()
                    .stroke(Color.orange, lineWidth: 5)
                    .frame(width: 100, height: 100, alignment: .center)
                Circle()
                    .stroke(Color.yellow, lineWidth: 5)
                    .frame(width: 120, height: 120, alignment: .center)
                Circle()
                    .stroke(Color.green, lineWidth: 5)
                    .frame(width: 140, height: 140, alignment: .center)
                Circle()
                    .stroke(Color.blue, lineWidth: 5)
                    .frame(width: 150, height: 150, alignment: .center)
                Image(systemName: "eye")
            }
            .frame(width: 150, height: 150)
            .border(.black)
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
