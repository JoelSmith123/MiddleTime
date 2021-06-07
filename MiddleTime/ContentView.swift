//
//  ContentView.swift
//  MiddleTime
//
//  Created by Joel Smith on 6/5/21.
//

import SwiftUI

struct ContentView: View {
    @State var showSavesMenu = false
    
    var body: some View {
        NavigationView {
            MainView()
            .navigationTitle("Midpoint Finder")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: (
                Button(action: {
                    withAnimation {
                        showSavesMenu.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                }
            ))
        }.sheet(isPresented: $showSavesMenu) {
            SavesMenu(showSavesMenu: $showSavesMenu)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
//                .preferredColorScheme(.dark)
//                .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
//                .previewDisplayName("iPhone 12")
            
        }
    }
}
