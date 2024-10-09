//
//  ContentView.swift
//  TrafficLightSwiftUI
//
//  Created by Данис Гаязов on 9.10.24..
//

import SwiftUI

struct ContentView: View {
    
    enum TrafficLight {
        case red, yellow, green
    }
    
    private let lightIsOffState = 0.3
    private let lightIsOnState = 1.0
    @State private var currentLight: TrafficLight = .red
    @State private var buttonName = "Start"
    
    var body: some View {
        VStack {
            Circle()
                .fill(Color.red)
                .opacity(currentLight == .red ? lightIsOnState : lightIsOffState)
                .frame(width: 100, height: 100)
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
            Circle()
                .fill(Color.yellow)
                .opacity(currentLight == .yellow ? lightIsOnState : lightIsOffState)
                .frame(width: 100, height: 100)
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
            Circle()
                .fill(Color.green)
                .opacity(currentLight == .green ? lightIsOnState : lightIsOffState)
                .frame(width: 100, height: 100)
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
        }
        .padding(.bottom, 350)
        
        VStack {
            Button(buttonName) {
                changeTrafficLightState()
                if buttonName == "Start" {
                        buttonName = "Next"
                    }
            }
        }
        .padding()
        .frame(width: 150, height: 50)
        .background(RoundedRectangle(cornerRadius: 40)
            .fill(Color.blue))
        .foregroundStyle(Color.white)
    }
    
    func changeTrafficLightState() {
        switch currentLight {
        case .red:
            currentLight = .yellow
        case .yellow:
            currentLight = .green
        case .green:
            currentLight = .red
        }
    }
}

#Preview {
    ContentView()
}
