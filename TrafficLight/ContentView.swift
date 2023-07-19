//
//  ContentView.swift
//  TrafficLight
//
//  Created by Алексей Турулин on 7/19/23.
//

import SwiftUI

struct ContentView: View {
    @State private var redLightOpacity = 1.0
    @State private var yellowLightOpacity = 0.5
    @State private var greenLightOpacity = 0.5
    @State private var currentLight = Light.red
    @State private var buttonTitle = "Start"
    
    private enum Light {
        case red
        case yellow
        case green
    }
    
    private func switchSignal() {
        buttonTitle = "Next"
        
        switch currentLight {
        case .red:
            currentLight = .yellow
            redLightOpacity = 0.5
            yellowLightOpacity = 1
            greenLightOpacity = 0.5
        case .yellow:
            currentLight = .green
            redLightOpacity = 0.5
            yellowLightOpacity = 0.5
            greenLightOpacity = 1
        case .green:
            currentLight = .red
            redLightOpacity = 1
            yellowLightOpacity = 0.5
            greenLightOpacity = 0.5
        }
    }
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                CircleView(color: .red, opacity: redLightOpacity)
                CircleView(color: .yellow, opacity: yellowLightOpacity)
                CircleView(color: .green, opacity: greenLightOpacity)
                Spacer()
                Button(action: { switchSignal() }) {
                    Text(buttonTitle)
                        .font(.title)
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
