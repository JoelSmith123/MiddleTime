//
//  ContentView.swift
//  MiddleTime
//
//  Created by Joel Smith on 6/5/21.
//

import SwiftUI
import CoreData

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
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MiddleTime")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        
        return container
    }()
    
    mutating func saveContext() {
      let context = persistentContainer.viewContext
      if context.hasChanges {
        do {
          try context.save()
        } catch {
          let nserror = error as NSError
          fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
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
