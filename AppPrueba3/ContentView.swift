//
//  ContentView.swift
//  AppPrueba3
//
//  Created by Rafael Miranda on 18/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 200, height: 200)
                .cornerRadius(20)
                .foregroundStyle(Color.blue)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
