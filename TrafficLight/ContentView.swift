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
    @State private var currentLight = Light.none

    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                CircleView(
                    color: .red,
                    opacity: currentLight == .red ? 1 : 0.3
                )
                CircleView(
                    color: .yellow,
                    opacity: currentLight == .yellow ? 1 : 0.3
                )
                CircleView(
                    color: .green,
                    opacity: currentLight == .green ? 1 : 0.3
                )
                
                Spacer()
                // Кнопка из лекции
                StartButtonView(title: buttonTitle) {
                    changeLabel()
                    switchLight()
                }
                // Моя кнопка
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
        switch currentLight {
        case .none:
            currentLight = .red
        case .red:
            currentLight = .yellow
        case .yellow:
            currentLight = .green
        case .green:
            currentLight = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
