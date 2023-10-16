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
    //READ:  from CoreData and set up an Array
    @FetchRequest(sortDescriptors: []) var countries: FetchedResults<Country>
 
    
    var body: some View {
        //someView with a List
        VStack {
            List {
                ForEach(countries, id: \.self) { country in
                    // for each country give me a
                    Section(country.wrappedFullName) {
                        // inside the section:
                        ForEach(country.candyArray, id: \.self) { candy in
                            Text(candy.wrappedName)
                        
                            // notice we didnt have to create the candyArray ourselves? thnx CoreData
                        }
                    }
                    
                }
            }
            Button("Add Candy") {
                //4 hardcoded examples for now
                let candy1 = Candy(context: moc)
                candy1.name = "Mars"
                candy1.origin = Country(context: moc)
                candy1.origin?.shortName = "UK"
                candy1.origin?.fullName = "United Kingdom"
                
                let candy2 = Candy(context: moc)
                candy2.name = "KitKat"
                candy2.origin = Country(context: moc)
                candy2.origin?.shortName = "UK"
                candy2.origin?.fullName = "United Kingdom"
                
                let candy3 = Candy(context: moc)
                candy3.name = "Engelse Drop"
                candy3.origin = Country(context: moc)
                candy3.origin?.shortName = "NL"
                candy3.origin?.fullName = "Netherlands"
                
                let candy4 = Candy(context: moc)
                candy4.name = "Toblerone"
                candy4.origin = Country(context: moc)
                candy4.origin?.shortName = "CH"
                candy4.origin?.fullName = "Switzerland"
                
                print(countries.count)
                try? moc.save()
            }
            
            Button("Delete") {
                // how to empy the candy examples ?
            }
            
        } // end VStack
       
    } //end someView
    //METHODS:
    
}

#Preview {
    ContentView()
}
