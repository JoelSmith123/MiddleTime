//
//  MainView.swift
//  MiddleTime
//
//  Created by Joel Smith on 6/6/21.
//

import SwiftUI

struct MainView: View {
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
            
            Button("Find Midpoint") {
                calculateMidpoint()
                showResult = true
            }
                .padding(.bottom, 25)
                .padding(.top, 25)
            
            if showResult {
                Button("Save Midpoint") {
                    saveMidpoint()
                }
                    .padding(.bottom, 25)
            }
            
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
    
    func saveMidpoint() {
//        let midpointToSave = [
//            "firstTime" : firstTime,
//            "secondTime" : secondTime,
//            "timeDifference" : timeDifference,
//            "midpoint" : result
//        ] as [String : Any]
    }
}
