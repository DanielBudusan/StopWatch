//
//  WatchView.swift
//  Stopwatch
//
//  Created by Daniel Budusan on 30.04.2024.
//

import SwiftUI


struct DigitalWatchView: View {
    var time: String = "00:00,00"
    
    var body: some View {
        HStack {
            Text(time)
                .font(.system(size: 90))
                .fontWeight(.thin)      
        }
    }
}

#Preview {
    DigitalWatchView()
}
