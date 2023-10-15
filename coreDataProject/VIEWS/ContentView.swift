//
//  ContentView.swift
//  coreDataProject
//  Day 57 Project 12 - 100DaysOfSwiftUI Paul Hudson
//  Created by yannemal on 15/10/2023.
//
import CoreData
import SwiftUI
//other Structs:

struct ContentView: View {
    // DATA: bring in the
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>
    @FetchRequest(sortDescriptors: [], predicate:  NSPredicate(format: "universe == 'StarWars'")) var ships: FetchedResults<Ship>
    
    var body: some View {
        //someView
        
        VStack{
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }
            Button("Add") {
                let wizard = Wizard(context: moc)
                wizard.name = "Hairy Otter"
            }
            Button("Save") {
                do {
                    try moc.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
            List(ships, id: \.self) { ship in
                Text(ship.name ?? "Unknown")
            }
            Button("Add Examples") {
                let ship1 = Ship(context: moc)
                ship1.name = "Enterprise"
                ship1.universe = "StarTrek"
                
                let ship2 = Ship(context: moc)
                ship2.name = "Millenium Falcon"
                ship2.universe = "StarWars"
                
                let ship3 = Ship(context: moc)
                ship3.name = "Defiant"
                ship3.universe = "StarTrek"
   
                let ship4 = Ship(context: moc)
                ship4.name = "Executor"
                ship4.universe = "StarWars"
                
                try? moc.save()
            }
        }
    }
    //METHODS:
    
}

#Preview {
    ContentView()
}
