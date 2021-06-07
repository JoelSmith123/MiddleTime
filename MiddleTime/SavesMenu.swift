//
//  SavesMenu.swift
//  MiddleTime
//
//  Created by Joel Smith on 6/6/21.
//

import SwiftUI

struct SavesMenu: View {
    @Binding var showSavesMenu: Bool
    
    var body: some View {
        NavigationView {
            VStack() {
                Text("Item 1")
                    .padding(.top, 50)
                
                Text("Item 2")
                    .padding(.top, 50)
                
                Text("Item 3")
                    .padding(.top, 50)
                
                Spacer()
            }
            .navigationBarTitle(Text("Saved Midpoints"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    showSavesMenu = false
                }) {
                    Text("Done").bold()
                })
        }

    }
}
