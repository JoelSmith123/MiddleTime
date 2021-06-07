//
//  ContentView.swift
//  MiddleTime
//
//  Created by Joel Smith on 6/5/21.
//

import SwiftUI

struct ContentView: View {
    @State var firstTime = Date()
    @State var secondTime = Date()
    @State var timeDifference = ""
    
    @State var showResult = false
    @State var result = Date()
    
    var body: some View {
        VStack {
            Text("First Time")
            DatePicker("First Time", selection: $firstTime)
                .labelsHidden()
                .clipped()
                .padding(.bottom, 25)
            
            Text("Second Time")
            DatePicker("Second Time", selection: $secondTime)
                .labelsHidden()
                .clipped()
                .padding(.bottom, 25)
            
            if showResult {
                Text("Midpoint")
                DatePicker("Midpoint", selection: $result, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .clipped()
                    .padding(.bottom, 25)
                
                Text("Time to midpoint:")
                Text(timeDifference)
                    .padding(.bottom, 25)
            }
            
            Button("Result") {
                calculateMidpoint()
                showResult = true
            }
                .padding(.bottom, 25)
                .padding(.top, 25)
            
            Button("Reset") {
                firstTime = Date()
                secondTime = Date()
                showResult = false
            }
                .foregroundColor(.red)
                .padding(.bottom, 25)
        }
    }
    
    func calculateMidpoint() {
        let timeDifferenceSeconds = Calendar.current.dateComponents([.second], from: firstTime, to: secondTime).second ?? 0
        let midpointSeconds = timeDifferenceSeconds / 2
        
        let totalMinutes = midpointSeconds / 60
        let totalHours = totalMinutes / 60
        
        let hours = String(totalHours)
        let minutes = String(totalMinutes % 60)
        timeDifference = (hours + "h ") + (minutes + "m ")

        result = firstTime.addingTimeInterval(TimeInterval(midpointSeconds))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
//                .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
//                .previewDisplayName("iPhone 12")
        }
    }
}
