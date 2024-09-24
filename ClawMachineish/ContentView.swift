//
//  ContentView.swift
//  ClawMachineish
//
//  Created by PM Student on 9/24/24.
//

import SwiftUI

struct ContentView: View {
    
    // variables for managing the rotation angle, length of line, and a timer
    @State var rotationAngle = 0.0
    @State var length = 50.0
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State var outerLineStart: CGFloat = 0.009 * 150
    
    // the inner radius of the circle
    let innerRadius = 25.0
    
    @GestureState var up = false
    @GestureState var down = false
    
    var body: some View {
        
        ZStack {
            Image("clawgamebackground")
                .resizable()
                .ignoresSafeArea()
            
            VStack() {
                
                ZStack(alignment: .top) {
                    VStack {
                        Line(length: length)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.gray)
                            .animation(Animation.linear, value: length)
                            .frame(width: 5, height: 500)
                            .offset(x: -innerRadius - 2, y: -39)
                        
                        Image("claw")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .offset(x: -innerRadius, y: -(500 - length))
                            .animation(Animation.linear, value: length)
                    }
                    ZStack {
                        Circle()
                            .trim(from: 0, to: outerLineStart)
                            .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                            .rotationEffect(Angle(degrees: -180))
                            .frame(width: (innerRadius * 2) + 1, height: (innerRadius * 2) + 4)
                            .foregroundColor(.gray)
                            .animation(Animation.linear, value: outerLineStart)
                        
                        ZStack {
                            Circle()
                                .stroke(lineWidth: 8)
                                .frame(width: 100, height: 100)
                                .foregroundColor(.white)
                            
                            ForEach(0..<6) { item in
                                Rectangle()
                                    .frame(width: 4, height: (innerRadius * 4) + 20)
                                    .foregroundColor(.white)
                                    .rotationEffect(Angle(degrees: Double(item * 60)))
                            }
                            Circle()
                                .frame(width: innerRadius * 2, height: innerRadius * 2)
                                .foregroundColor(Color("darkgray"))
                        }
                        .rotationEffect(Angle(degrees: rotationAngle))
                        .animation(Animation.linear, value: rotationAngle)
                    }
                }
                HStack {
                    Image(systemName: "arrowtriangle.up.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75, height: 75)
                    
                    Spacer()
                    
                    Image(systemName: "arrowtriangle.down.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75, height: 75)
                }
                .frame(width: 200, height: 50)
                // gesturestate = used to track temporary changes during user interaction such as dragging or tapping, and updating the view accordingly
            }
        }
    }
}

#Preview {
    ContentView()
}
