//
//  DataController.swift
//  coreDataProject
//  Day 57 Project 12 - 100DaysOfSwiftUI Paul Hudson
//  Created by yannemal on 15/10/2023.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "CoreDataProject")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load : \(error.localizedDescription)")
                return
            }
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
        
    }
}
