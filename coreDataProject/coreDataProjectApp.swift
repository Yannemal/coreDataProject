//
//  coreDataProjectApp.swift

//  coreDataProject
//  Day 57 Project 12 - 100DaysOfSwiftUI Paul Hudson
//  Created by yannemal on 15/10/2023.
//

import SwiftUI

@main
struct coreDataProjectApp: App {
    //DATA:
    @StateObject private var dataController = DataController()

    var body: some Scene {
        //someView MAIN
        
        
        WindowGroup {
            ContentView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}

