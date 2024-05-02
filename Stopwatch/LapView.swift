//
//  LapView.swift
//  Stopwatch
//
//  Created by Daniel Budusan on 02.05.2024.
//

import SwiftUI

struct LapView: View {
    var index: Int
    var lapTime: String
    
    var body: some View {
        Divider()
            .overlay(Color.gray.opacity(0.7))
        HStack {
            Text("Lap " + "\(index + 1)")
            Spacer()
            Text(lapTime)
        }
        .font(.headline)
        .padding(5)
        .monospacedDigit()
    }
}

#Preview {
    LapView(index: 3, lapTime: "12:12,12")
}
