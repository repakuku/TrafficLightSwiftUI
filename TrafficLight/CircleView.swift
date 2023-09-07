//
//  CircleView.swift
//  TrafficLight
//
//  Created by Алексей Турулин on 7/19/23.
//

import SwiftUI

struct CircleView: View {
    
    let color: Color
    let shadowColor: Color
    let opacity: Double
    
    var body: some View {
        Circle()
            .frame(width: 150)
            .foregroundColor(color)
            .opacity(opacity)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(color: shadowColor, radius: 10)
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(color: .red, shadowColor: .red, opacity: 1)
    }
}
