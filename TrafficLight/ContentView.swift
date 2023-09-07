//
//  ContentView.swift
//  TrafficLight
//
//  Created by Алексей Турулин on 7/19/23.
//

import SwiftUI

enum Light {
    case none
    case red
    case yellow
    case green
}

struct ContentView: View {
    
    @State private var buttonTitle = "START"
    
    @State private var redLightOpacity = 0.5
    @State private var yellowLightOpacity = 0.5
    @State private var greenLightOpacity = 0.5
    
    @State private var nextLight = Light.none

    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                CircleView(
                    color: .red,
                    shadowColor: nextLight == .yellow ? .red : .black,
                    opacity: redLightOpacity
                )
                CircleView(
                    color: .yellow,
                    shadowColor: nextLight == .green ? .yellow : .black,
                    opacity: yellowLightOpacity
                )
                CircleView(
                    color: .green,
                    shadowColor: nextLight == .red ? .green : .black,
                    opacity: greenLightOpacity
                )
                
                Spacer()
                
                Button(buttonTitle) {
                    changeLabel()
                    switchLight()
                }
                .buttonStyle(CustomButton())
            }
            .padding()
        }
    }
    
    private func changeLabel() {
        if buttonTitle == "START" {
            buttonTitle = "NEXT"
        }
    }
    
    private func switchLight() {
        
        let lightIsOn = 1.0
        let lightIsOff = 0.3
        
        switch nextLight {
        case .none:
            nextLight = .yellow
            redLightOpacity = lightIsOn
        case .red:
            nextLight = .yellow
            redLightOpacity = lightIsOn
            greenLightOpacity = lightIsOff
        case .yellow:
            nextLight = .green
            yellowLightOpacity = lightIsOn
            redLightOpacity = lightIsOff
        case .green:
            nextLight = .red
            greenLightOpacity = lightIsOn
            yellowLightOpacity = lightIsOff
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
