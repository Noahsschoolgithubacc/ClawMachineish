//
//  Line.swift
//  ClawMachineish
//
//  Created by PM Student on 9/24/24.
//

import SwiftUI

struct Line: Shape {
    
    var length = 0.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // draw line based on length
        path.move(to: CGPoint(x: rect.width / 2, y: rect.height / 5))
        path.addLine(to: CGPoint(x: rect.width / 2, y: (rect.height / 5) + length))
        
        return path
    }
}

#Preview {
    Line(length: 100)
        .stroke(lineWidth: 2)
        .foregroundColor(.gray)
}
