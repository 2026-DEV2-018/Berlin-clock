//
//  ContentView.swift
//  Berlin clock
//
//  Created by 2026-DEV2-018 on 13/01/2026.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
            Circle()
                .stroke(.black, lineWidth: 2)
                .fill(viewModel.isSecondsLampIluminated ? .yellow : .clear)
                .frame(width: 50, height: 50)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
