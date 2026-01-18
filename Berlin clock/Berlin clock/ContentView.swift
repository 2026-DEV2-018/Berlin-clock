//
//  ContentView.swift
//  Berlin clock
//
//  Created by 2026-DEV2-018 on 13/01/2026.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack(spacing: 12) {
            Circle()
                .stroke(.black, lineWidth: 2)
                .frame(width: 50, height: 50)
            
            HStack(spacing: 8) {
                ForEach(0 ..< 4, id: \.self) { fiveHourBlock in
                    Rectangle()
                        .stroke(.black, lineWidth: 2)
                        .frame(width: 50, height: 20)
                }
            }
            
            HStack(spacing: 8) {
                ForEach(0 ..< 4, id: \.self) { oneHourBlock in
                    Rectangle()
                        .stroke(.black, lineWidth: 2)
                        .frame(width: 50, height: 20)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
