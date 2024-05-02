//
//  LapView.swift
//  Stopwatch
//
//  Created by Daniel Budusan on 02.05.2024.
//

import SwiftUI

struct LapView: View {
    var index: Int
    var lap: Lap
    
    var body: some View {
        Divider()
            .overlay(Color.gray.opacity(0.7))
        HStack {
            Text("Lap " + "\(index + 1)")
            Spacer()
            Text(lap.timeString)
        }
        .font(.headline)
        .padding(5)
    }
}

#Preview {
    LapView(index: 3, lap: Lap(time: 23))
}
