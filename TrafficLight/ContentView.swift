//
//  ContentView.swift
//  TrafficLight
//
//  Created by Алексей Турулин on 7/19/23.
//

import SwiftUI

enum Light {
    case red
    case yellow
    case green
}

struct ContentView: View {
    
    @State private var buttonTitle = "START"
    
    @State private var redLightOpacity = 0.5
    @State private var yellowLightOpacity = 0.5
    @State private var greenLightOpacity = 0.5
    
    @State private var currentLight = Light.red

    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                CircleView(color: .red, shadowColor: currentLight == .yellow ? .red : .black, opacity: redLightOpacity)
                CircleView(color: .yellow, shadowColor: currentLight == .green ? .yellow : .black, opacity: yellowLightOpacity)
                CircleView(color: .green, shadowColor: currentLight == .red ? .green : .black, opacity: greenLightOpacity)
                
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
        
        switch currentLight {
        case .red:
            currentLight = .yellow
            redLightOpacity = lightIsOn
            greenLightOpacity = lightIsOff
        case .yellow:
            currentLight = .green
            yellowLightOpacity = lightIsOn
            redLightOpacity = lightIsOff
        case .green:
            currentLight = .red
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
