//
//  CustomButton.swift
//  TrafficLight
//
//  Created by Алексей Турулин on 7/19/23.
//

import SwiftUI

struct CustomButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Capsule()
                .foregroundColor(.blue)
                .overlay(Capsule().stroke(Color.white, lineWidth: 4))
            configuration.label
                .opacity(configuration.isPressed ? 0.5 : 1)
                .foregroundColor(.white)
                .font(.title.bold())
        }
        .frame(width: 150, height: 60)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        Button("START") {
            
        }
        .buttonStyle(CustomButton())
    }
}
